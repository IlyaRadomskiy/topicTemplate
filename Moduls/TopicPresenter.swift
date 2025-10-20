//
//  TopicPresenter.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import Foundation

import Foundation

protocol ITopicPresenter: AnyObject {
    func loadTopics()
}

final class TopicPresenter: ITopicPresenter {
    weak var view: ITopicPresenterView?
    private let interactor: ITopicInteractor

    init(view: ITopicPresenterView, interactor: ITopicInteractor) {
        self.view = view
        self.interactor = interactor
    }

    func loadTopics() {
        let sections = interactor.fatchTopic()
        view?.showTopics(sections)
    }
}

// временная заглушка для сборки
final class DummyPresenter: ITopicPresenter {
    func loadTopics() {}
}

