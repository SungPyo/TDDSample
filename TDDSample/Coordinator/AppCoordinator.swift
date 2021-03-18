//
//  Navigation.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/19.
//

import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

class AppCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let memoListCoordinator = MemoListCoordinator(navigationController: navigationController)
        memoListCoordinator.parentCoordinator = self
        childCoordinator.append(memoListCoordinator)
        memoListCoordinator.start()
    }
}
