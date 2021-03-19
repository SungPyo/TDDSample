//
//  Navigation.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/19.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinator: [Coordinator] { get set }
    func start()
}

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
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
