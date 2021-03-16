//
//  MemoNavigator.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/17.
//

import UIKit

protocol MemoNavigatorProtocol {
    func dismiss()
}

final class MemoNavigator: MemoNavigatorProtocol {
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func dismiss() {
        navigation.popViewController(animated: true)
    }
}
