//
//  NoteEditorView.swift
//  MyNoteDump
//
//  Created by Pawandeep Singh on 2/8/24.
//

import SwiftUI

struct NoteEditorView: View {
    
//    How to know it is for adding or adding?
    @EnvironmentObject var noteModel: NoteModel
    
    @Binding var note: Note
    
    var noteIndex: Int? {
        // either at specific index, or end of array (which denotes last element)
        noteModel.notes.firstIndex { $0.id == note.id }
    }
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading) {
                TextField("Enter Title here", text: $note.title)
                    .font(.title)
                    .textInputAutocapitalization(.words)
                Divider()
                
                TextEditor(text: $note.descripion)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        note.descripion = ""
                    }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Last Updated: \(note.dateCreated.formatted())")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                }
                
                
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            
            .navigationTitle(note.title)
            .toolbar {
                // to save
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // can only save if there is contents?
                        
                        note.dateCreated = .now
                        if isInputsFilled() { // only if there is inputs
                            if let index = noteIndex {
                                noteModel.updateNote(noteIndex: index, note)
                            } else { // means new Note
                                noteModel.createNote(note: note)
                            }
                        } else {
                            noteModel.resetNewNote()
                        }
                        presentationMode.wrappedValue.dismiss()
                        
                        
                    } label: {
                        Image(systemName: "checkmark")
                    }
//
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90.0))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func isInputsFilled() -> Bool {
        return !note.title.trimmingCharacters(in: .whitespaces).isEmpty ||
        !note.descripion.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

struct NoteEditorView_Previews: PreviewProvider {
    static var previews: some View {
        NoteEditorView(note: .constant(.mockData[0]))
            .environmentObject(NoteModel())
    }
}
