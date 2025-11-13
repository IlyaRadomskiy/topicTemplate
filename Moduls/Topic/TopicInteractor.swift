//
//  TopicInteractor.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import Foundation

protocol ITopicInteractor: AnyObject {
    func fetchTopic() -> [TopicSection]
}

final class TopicInteractor: ITopicInteractor {
    func fetchTopic() -> [TopicSection] {
        return [
            TopicSection(
                title: "Section 1",
                topics: [
                    Topic(title: "Mindfulness", imageURL: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg"),
                    Topic(title: "Self-care", imageURL: "https://i.pinimg.com/736x/46/92/5d/46925d1c93a7d08410ca24bda94a12b1.jpg"),
                    Topic(title: "Motivation", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRusff_5mR5oo5xOKPdRTb0TYjruMMA2qrxWQ&s"),
                    Topic(title: "Psychology", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5uN5_KWYBmASZyqFjBS4C258cn8sFLdEt_A&s")
                ]
            ),
            TopicSection(
                title: "Section 2",
                topics: [
                    Topic(title: "Nutritionklmldfkmvlkdmfvlkdmlk", imageURL: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg"),
                    Topic(title: "Fitness", imageURL: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg"),
                    Topic(title: "Sleep", imageURL: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg"),
                    Topic(title: "Wellness", imageURL: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg"),
                    Topic(title: "Routine", imageURL: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg")
                ]
            ),
            TopicSection(
                title: "Section 3",
                topics: [
                    Topic(title: "Work-life", imageURL: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg"),
                    Topic(title: "Relationships", imageURL: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg"),
                    Topic(title: "Balance", imageURL: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg"),
                    Topic(title: "Focus", imageURL: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg"),
                    Topic(title: "Happiness", imageURL: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg"),
                    Topic(title: "Creativity", imageURL: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg")
                ]
            )
        ]
    }
}

