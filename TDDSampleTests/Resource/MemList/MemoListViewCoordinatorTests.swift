//
//  MemoListViewNavigatorTests.swift
//  TDDSampleTests
//
//  Created by Pyo Cho on 2021/03/17.
//

import UIKit

@testable import TDDSample

final class MemoListViewCoordinatorStub: MemoListCoordinatorProtocol {
    var parentCoordinator: Coordinator?
    var childCoordinator: [Coordinator] = []
    func start() {}
    
    typealias NavigateToMemoExecutionInput = Model.Memo?
    typealias NavigateToMemoExecutionOutput = ()
    typealias NavigateToMemoExecution = (NavigateToMemoExecutionInput, NavigateToMemoExecutionOutput)
    var navigateToMemoExecutions: [NavigateToMemoExecution] = []
    func navigateToMemo(memo: Model.Memo?) {
        let input: NavigateToMemoExecutionInput = memo
        let output: NavigateToMemoExecutionOutput = ()
        let execution: NavigateToMemoExecution = (input,output)
        self.navigateToMemoExecutions.append(execution)
    }
}
