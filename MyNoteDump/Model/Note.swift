//
//  Note.swift
//  MyNoteDump
//
//  Created by Pawandeep Singh on 6/8/24.
//

import Foundation

class Note: Identifiable {
    var id = UUID()
    
    var title: String = ""
    var descripion: String = ""
    var dateCreated: Date = .now
    
    init() {}
    
    init(title: String, descripion: String, dateCreated: Date) {
        self.title = title
        self.descripion = descripion
        self.dateCreated = dateCreated
    }
    
    static let mockData: [Note] =
    [
        Note(title: "Title 1", descripion: "Description", dateCreated: .now),
        Note(title: "Title 2", descripion: "Description", dateCreated: .now),
        Note(title: "Title 3", descripion: "Description", dateCreated: .now)
    ]
    
    
}
