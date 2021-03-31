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
        let memoDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MemoDetailViewController") as! MemoDetailViewController
        let memoDetailViewModel = MemoDetailViewModel(memoService: MemoService.shared,
                                          memo: memo,
                                          coordinator: self)
        memoDetailViewController.initialize(viewModel: memoDetailViewModel)
        navigationController.pushViewController(memoDetailViewController, animated: true)
    }
    
    func dismiss() {
        navigationController.popViewController(animated: true)
    }
}
