//
//  TopicsAssemble.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import UIKit

struct TopicAssembly {
    func createModule() -> UIViewController {

        let interactor = TopicInteractor()
        let router = TopicRouter()
        let presenter = TopicPresenter(interactor: interactor)
        let viewController = TopicViewController(presenter: presenter)

        presenter.view = viewController
        presenter.router = router
        router.viewController = viewController
        
        return viewController
    }
}
