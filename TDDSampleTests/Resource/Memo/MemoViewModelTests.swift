//
//  MemoViewModelTests.swift
//  TDDSampleTests
//
//  Created by Pyo Cho on 2021/03/19.
//

import XCTest
@testable import TDDSample

class MemoViewModelTests: XCTestCase {
    
}

class MemoViewModelStub: MemoViewModelType {
    typealias ActionExcutionInput = MemoViewModelAction
    typealias ActionExcutionOutput = ()
    typealias ActionExcutions = (ActionExcutionInput, ActionExcutionOutput)
    var actionExcutions: [ActionExcutions] = []
    override func action(_ action: MemoViewModelType.Action) {
        let input: ActionExcutionInput = action
        let output: ActionExcutionOutput = ()
        let excution: ActionExcutions = (input, output)
        actionExcutions.append(excution)
    }
}
