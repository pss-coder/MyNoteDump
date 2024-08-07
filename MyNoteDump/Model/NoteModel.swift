//
//  NoteModel.swift
//  MyNoteDump
//
//  Created by Pawandeep Singh on 6/8/24.
//

import Foundation

class NoteModel: ObservableObject {
    // save fetched notes for view loading
    
    @Published var notes: [Note] = Note.mockData
    
    @Published var edittedNote: Note?
    
    func createNote(note: Note) {
        notes.append(note)
    }
    
    func updateNote(noteIndex: Int?, _ note: Note?) {
        
        guard let noteIndex else { createNote(note: note!); return}
        
        notes[noteIndex] = note!
    }
    
    func delete(Note: Note) -> Note {
        notes.removeAll { note in return note.id == Note.id }
        return Note
    }
    
    
    
}
