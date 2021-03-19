//
//  MemoViewNavigatorTests.swift
//  TDDSampleTests
//
//  Created by Pyo Cho on 2021/03/19.
//

import XCTest
@testable import TDDSample

final class MemoViewCoordinatorStub: MemoCoordinatorProtocol {
    var parentCoordinator: Coordinator?
    var childCoordinator: [Coordinator] = []
    func start() {}
    
    typealias DismissExcutionInput = ()
    typealias DismissExcutionOutput = ()
    typealias DismissExcutions = ((), ())
    var dismissExcutions: [DismissExcutions] = []
    func dismiss() {
        let input: DismissExcutionInput = ()
        let output: DismissExcutionOutput = ()
        let excution: DismissExcutions = (input, output)
        dismissExcutions.append(excution)
    }
}
