//
//  TopicRouter.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import UIKit

protocol ITopicRouter: AnyObject { }

final class TopicRouter: ITopicRouter {
    weak var viewController: UIViewController?
}
