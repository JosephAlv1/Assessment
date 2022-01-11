//
//  AppCoordinator.swift
//  Assessment
//
//  Created by iQueue on 11/01/2022.
//

import Foundation
import UIKit

// MARK: - AppRouter Protocol
protocol AppRouter: AnyObject {
    func start()
}

final class AppCoordinator {
    
    private var window: UIWindow
    private var loginCoordinator: MasterCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Private Methods
    private func showLogin() {
        self.loginCoordinator = MasterCoordinator(window: self.window)
        self.loginCoordinator?.start()
    }
}

// MARK: - AppRouter Delegates
extension AppCoordinator: AppRouter {
    
    func start() {
        self.window.backgroundColor = .white
        self.window.overrideUserInterfaceStyle = .light
        self.window.makeKeyAndVisible()
        showLogin()
    }
}
