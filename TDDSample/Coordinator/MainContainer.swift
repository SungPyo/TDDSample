//
//  MainContainer.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/19.
//

import UIKit

class MainContainer: UINavigationController {    
    var coordinator: AppCoordinator!

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = AppCoordinator(navigationController: self)
        coordinator.start()
    }
}
