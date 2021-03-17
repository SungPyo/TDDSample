//
//  MemoServiceTests.swift
//  TDDSampleTests
//
//  Created by Pyo Cho on 2021/03/17.
//

import Foundation
@testable import TDDSample

final class MemoServiceStub: MemoServiceProtocol {

    typealias MemosExecutionInput = ([Model.Memo]) -> ()
    typealias MemosExecutionOutput = Void
    typealias MemosExecution = (MemosExecutionInput, MemosExecutionOutput)
    var memosExecutions: [MemosExecution] = []
    var memosCompletion: ((MemosExecutionInput) -> MemosExecutionOutput)?
    func memos(completion: @escaping ([Model.Memo]) -> ()) {
        let input: MemosExecutionInput = completion
        let output: MemosExecutionOutput = memosCompletion?(input) ?? ()
        let execution: MemosExecution = (input, output)
        self.memosExecutions.append(execution)
    }

    typealias AddMemoExecutionInput = String
    typealias AddMemoExecutionOutput = Void
    typealias AddMemoExecution = (AddMemoExecutionInput, AddMemoExecutionOutput)
    var addMemoExecutions: [AddMemoExecution] = []
    func addMemo(content: String) {
        let input: AddMemoExecutionInput = content
        let output: AddMemoExecutionOutput = ()
        let execution: AddMemoExecution = (input, output)
        self.addMemoExecutions.append(execution)
    }
    
    typealias UpdateMemoExecutionInput = Model.Memo
    typealias UpdateMemoExecutionOutput = Void
    typealias UpdateMemoExecution = (UpdateMemoExecutionInput, UpdateMemoExecutionOutput)
    var updateMemoExecutions: [UpdateMemoExecution] = []
    func updateMemo(memo: Model.Memo) {
        let input: UpdateMemoExecutionInput = memo
        let output: UpdateMemoExecutionOutput = ()
        let execution: UpdateMemoExecution = (input, output)
        self.updateMemoExecutions.append(execution)
    }
}
