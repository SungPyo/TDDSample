//
//  MemoViewModelTests.swift
//  TDDSampleTests
//
//  Created by Pyo Cho on 2021/03/19.
//

import XCTest
@testable import TDDSample

class MemoViewModelTests: XCTestCase {
    var memoService: MemoServiceStub!
    var viewModel: MemoDetailViewModel! //Test
    var delegateStub: MemoViewModelDelegateStub!
    var coordinator: MemoViewCoordinatorStub!

    override func setUp() {
        super.setUp()
        
        let memoStub = Model.Memo(id: 123, content: "12345")
        initialize(memoStub: memoStub)
    }

    func initialize(memoStub: Model.Memo?) {
        memoService = MemoServiceStub()
        coordinator = MemoViewCoordinatorStub()
        viewModel = MemoDetailViewModel(memoService: memoService,
                                  memo: memoStub,
                                  coordinator: coordinator)
        delegateStub = MemoViewModelDelegateStub()
        viewModel.delegate = delegateStub
    }
    
    func test_inputContent_액션() {
        //when
        viewModel.action(.inputContent("content"))
        //then
        XCTAssertEqual(delegateStub.setContentExcutions.count, 1)
    }
    
    func test_didTapSave_액션() {
        //when
        viewModel.action(.didTapSave)
        //then
        XCTAssertEqual(coordinator.dismissExcutions.count, 1)
        XCTAssertEqual(memoService.updateMemoExecutions.count, 1)

        //given
        viewModel = MemoDetailViewModel(memoService: memoService,
                                  memo: nil,
                                  coordinator: coordinator)
        //when
        viewModel.action(.didTapSave)
        
        //then
        XCTAssertEqual(memoService.addMemoExecutions.count, 1)
    }
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

class MemoViewModelDelegateStub: MemoViewModelDelegate {
    typealias SetContentExcutionInput = String?
    typealias SetContentExcutionOutput = ()
    typealias SetContentExcutions = (SetContentExcutionInput, SetContentExcutionOutput)
    var setContentExcutions: [SetContentExcutions] = []
    func setContent(_ content: String?) {
        let input: SetContentExcutionInput = content
        let output: SetContentExcutionOutput = ()
        let excution: SetContentExcutions = (input, output)
        setContentExcutions.append(excution)
    }
    
    typealias SetSaveButtonExcutionInput = Bool
    typealias SetSaveButtonExcutionOutput = ()
    typealias SetSaveButtonExcutions = (SetSaveButtonExcutionInput, SetSaveButtonExcutionOutput)
    var setSaveButtonExcutions: [SetSaveButtonExcutions] = []
    func setSaveButtonEnabled(_ isEnabled: Bool) {
        let input: SetSaveButtonExcutionInput = isEnabled
        let output: SetSaveButtonExcutionOutput = ()
        let excution: SetSaveButtonExcutions = (input, output)
        setSaveButtonExcutions.append(excution)
    }
}
