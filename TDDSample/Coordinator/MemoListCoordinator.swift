//
//  MemoListNavigator.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/16.
//

import UIKit

protocol MemoListCoordinatorProtocol: Coordinator {
    func navigateToMemo(memo: Model.Memo?)
}

final class MemoListCoordinator: MemoListCoordinatorProtocol {
    var parentCoordinator: AppCoordinator?
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        let memoListViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "MemoListViewController") as! MemoListViewController
        let memoListViewModel = MemoListViewModel(memoService: MemoService.shared,
                                                  coordinator: self)
        memoListViewController.initialize(viewModel: memoListViewModel)
        navigationController.setViewControllers([memoListViewController], animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateToMemo(memo: Model.Memo?) {
        let memoCoordinator = MemoCoordinator(navigationController: navigationController,
                                              memo: memo)
        memoCoordinator.parentCoordinator = self
        childCoordinator.append(memoCoordinator)
        memoCoordinator.start()
    }
}
