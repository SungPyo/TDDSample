//
//  MemoListNavigator.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/16.
//

import UIKit

protocol MemoListNavigatorProtocol {
    func navigateToMemo(memo: Model.Memo)
    func navigateToCreateMemo()
}

final class MemoListNavigator: MemoListNavigatorProtocol {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func navigateToMemo(memo: Model.Memo) {
        let memoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MemoViewController") as! MemoViewController
        memoViewController.setupMemo(memo: memo)
        navigation.pushViewController(memoViewController, animated: true)
    }
    
    func navigateToCreateMemo() {
        let memoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MemoViewController") as! MemoViewController
        navigation.pushViewController(memoViewController, animated: true)
    }
}
