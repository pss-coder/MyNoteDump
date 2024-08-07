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
                    List($noteModel.notes, id: \.id) { item in
                        NavigationLink {
                            //Text(item.title)
                            NoteEditorView(note: item)
                                .environmentObject(noteModel)
                        } label: {
                            Text(item.title.wrappedValue)
                        }

                    }
                }
                
            }
            .navigationTitle("NoteDump")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.blue)
                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink {
//                        NoteEditorView(note: )
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
