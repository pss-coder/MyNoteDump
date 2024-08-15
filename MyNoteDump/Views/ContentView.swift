//
//  ContentView.swift
//  MyNoteDump
//
//  Created by Pawandeep Singh on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var noteModel = NoteModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if noteModel.notes.isEmpty {Text("No Notes")}
                else {
                    List($noteModel.notes, id: \.id, editActions: [.delete]) { item in
                        NavigationLink {
                            //Text(item.title)
                            NoteEditorView(note: item) // binding item
                                .environmentObject(noteModel)
                        } label: {
                            VStack(alignment:.leading,content: {
                                Text(item.title.wrappedValue)
                                    .font(.headline)
                                
                                Text(item.descripion.wrappedValue)
                                    .padding(.bottom)
                                
                                Text(item.dateCreated.wrappedValue.formatted())
                                    .font(.caption2)
                                    
                                    .foregroundStyle(.gray)
                            })
                        }
                        
                    }
                    .listRowSpacing(20)
                    
                }
                
            }
            .navigationTitle("NoteDump")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.blue)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        // pass binding item here
                        NoteEditorView(note: $noteModel.newNote)
                            .environmentObject(noteModel)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }

                }
                
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink {
//                        NoteEditorView(note: noteModel.$edittedNote)
//                            .environmentObject(noteModel)
//                    } label: {
//                        Image(systemName: "plus")
//                            .foregroundColor(.blue)
//                    }
//
//                }
                
            }
        }
    }
    
    func deleteNote(at offset: IndexSet) {
        noteModel.notes.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
