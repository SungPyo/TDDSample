//
//  MemoNavigator.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/17.
//

import UIKit

protocol MemoCoordinatorProtocol: Coordinator {
    func dismiss()
}

final class MemoCoordinator: MemoCoordinatorProtocol {
    var parentCoordinator: Coordinator?
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    var memo: Model.Memo?
    
    init(navigationController: UINavigationController,
         memo: Model.Memo?) {
        self.navigationController = navigationController
        self.memo = memo
    }
    
    func start() {
        let memoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MemoViewController") as! MemoViewController
        let memoViewModel = MemoViewModel(memoService: MemoService.shared,
                                          memo: memo,
                                          coordinator: self)
        memoViewController.initialize(viewModel: memoViewModel)
        navigationController.pushViewController(memoViewController, animated: true)
    }
    
    func dismiss() {
        navigationController.popViewController(animated: true)
    }
}
