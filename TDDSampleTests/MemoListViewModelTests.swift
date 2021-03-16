//
//  MemoListViewModelTests.swift
//  TDDSampleTests
//
//  Created by Pyo Cho on 2021/03/17.
//

import XCTest
@testable import TDDSample

class MemoListViewModelTests: XCTestCase {
    
    
}

final class MemoListViewModelStub: MemoListViewModel {
  typealias ActionExecutionInput = (MemoListViewModelType.Action)
  typealias ActionExecutionOutput = (Void)
  typealias ActionExecution = (ActionExecutionInput, ActionExecutionOutput)
  var actionExecutions: [ActionExecution] = []
  override func action(_ action: MemoListViewModelType.Action) {
    let input: ActionExecutionInput = (action)
    let output: ActionExecutionOutput = (Void())
    let execution: ActionExecution = (input, output)
    self.actionExecutions.append(execution)
  }
}
