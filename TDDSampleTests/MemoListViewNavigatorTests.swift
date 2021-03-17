//
//  MemoListViewNavigatorTests.swift
//  TDDSampleTests
//
//  Created by Pyo Cho on 2021/03/17.
//

import Foundation

@testable import TDDSample

final class MemoListViewNavigatorStub: MemoListNavigatorProtocol {
    typealias NavigateToMemoExecutionInput = Model.Memo
    typealias NavigateToMemoExecutionOutput = Void
    typealias NavigateToMemoExecution = (NavigateToMemoExecutionInput, NavigateToMemoExecutionOutput)
    var navigateToMemoExecutions: [NavigateToMemoExecution] = []
    func navigateToMemo(memo: Model.Memo) {
        let input: NavigateToMemoExecutionInput = memo
        let output: NavigateToMemoExecutionOutput = ()
        let execution: NavigateToMemoExecution = (input, output)
        self.navigateToMemoExecutions.append(execution)
    }
    
    typealias NavigateToCreateMemoExecutionInput = Void
    typealias NavigateToCreateMemoExecutionOutput = Void
    typealias NavigateToCreateMemoExecution = (NavigateToCreateMemoExecutionInput, NavigateToCreateMemoExecutionOutput)
    var navigateToCreateMemoExecutions: [NavigateToCreateMemoExecution] = []
    func navigateToCreateMemo() {
        let input: NavigateToCreateMemoExecutionInput = ()
        let output: NavigateToCreateMemoExecutionOutput = ()
        let execution: NavigateToCreateMemoExecution = (input, output)
        self.navigateToCreateMemoExecutions.append(execution)
    }
}
