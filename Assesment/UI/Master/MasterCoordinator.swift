//
//  MasterCoordinator.swift
//  Assessment
//
//  Created by iQueue on 11/01/2022.
//

import UIKit

// MARK: - Master Router Protocol
protocol MasterRouter: AnyObject {
    func start()
}

// MARK: - MasterCoordinator Class
class MasterCoordinator {
    private var window: UIWindow
    private var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
}

// MARK: - Routing
extension MasterCoordinator: MasterRouter {
    func start() {
        let masterViewController = MasterViewController.initiateFrom(Storybaord: .main)
        masterViewController.interactor = MasterInteractor(presenter: MasterPresenter(viewController: masterViewController))
        masterViewController.router = self
        self.window.rootViewController = UINavigationController(rootViewController: masterViewController)
    }
}
