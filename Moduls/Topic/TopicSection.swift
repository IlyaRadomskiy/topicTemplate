//
//  TopicSection.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import Foundation

struct TopicSection {
    let title: String
    let topics: [Topic]
}

struct Topic: Hashable {

    let id: UUID
    let title: String
    let imageURL: String

    init(
        id: UUID = UUID(),
        title: String,
        imageURL: String
    ) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
    }
}
