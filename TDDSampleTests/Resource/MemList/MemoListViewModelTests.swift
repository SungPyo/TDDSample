//
//  MemoListViewModelTests.swift
//  TDDSampleTests
//
//  Created by Pyo Cho on 2021/03/17.
//

import XCTest
@testable import TDDSample

final class MemoListViewModelTests: XCTestCase {
//    var memoService: MemoServiceStub!
//    var viewModel: MemoListViewModel! //Test
//    var delegateStub: MemoListViewModelDelegateStub!
//
//    override func setUp() {
//        super.setUp()
//        initialize()
//    }
//
//    func initialize() {
//        memoService = MemoServiceStub()
//        viewModel = MemoListViewModel(memoService: memoService, coordinator: MemoListCoordinator(navigationController: UINavigationController()))
//        delegateStub = MemoListViewModelDelegateStub()
//        viewModel.delegate = delegateStub
//    }
//    
//    func test_didTapAddMemo_액션() {
//        //when
//        viewModel.action(.didTapAddMemo)
//        
//        //then
//        XCTAssertEqual(delegateStub.NavigateToCreateMemoExecutions.count, 1)
//    }
//    
//    func test_didTapMemo_액션() {
//        
//        //given
//        let memo = Model.Memo(id: 123, content: "12345")
//        
//        //when
//        viewModel.action(.didTapMemo(memo))
//        
//        //then
//        XCTAssertEqual(delegateStub.navigateToMemoExecutions.count, 1)
//        XCTAssertEqual(delegateStub.navigateToMemoExecutions[0].0, memo)
//    }
//    
//    func test_refresh_액션() {
//        let memo = Model.Memo(id: 123, content: "12345")
//        let memos = [memo]
//        let sections = [memos]
//        //when
//        memoService.memosCompletion = { completion in
//            completion(memos)
//        }
//        viewModel.action(.refresh)
//        //then
//        XCTAssertEqual(memoService.memosExecutions.count, 1)
//        XCTAssertEqual(delegateStub.setSectionsExecutions[0].0, sections)
//    }
}

final class MemoListViewModelStub: MemoListViewModelType {
    typealias ActionExecutionInput = MemoListViewModelType.Action
    typealias ActionExecutionOutput = Void
    typealias ActionExecution = (ActionExecutionInput, ActionExecutionOutput)
    
    var actionExecutions: [ActionExecution] = []
    
    override func action(_ action: MemoListViewModelType.Action) { //액션이 올바르게 작동하는지 점검하기 위해서.
        let input: ActionExecutionInput = action
        let output: ActionExecutionOutput = ()
        let execution: ActionExecution = (input, output)
        self.actionExecutions.append(execution)
    }
}

final class MemoListViewModelDelegateStub: MemoListViewModelDelegate {
    typealias SetSectionsExecutionInput = [[Model.Memo]]
    typealias SetSectionsExecutionOutput = Void
    typealias SetSectionsExecution = (SetSectionsExecutionInput, SetSectionsExecutionOutput)
    var setSectionsExecutions: [SetSectionsExecution] = []
    func setSections(sections: [[Model.Memo]]) {
        let input: SetSectionsExecutionInput = sections
        let output: SetSectionsExecutionOutput = ()
        let execution: SetSectionsExecution = (input,output)
        self.setSectionsExecutions.append(execution)
    }
    
    typealias NavigateToMemoExecutionInput = Model.Memo
    typealias NavigateToMemoExecutionOutput = Void
    typealias NavigateToMemoExecution = (NavigateToMemoExecutionInput, NavigateToMemoExecutionOutput)
    var navigateToMemoExecutions: [NavigateToMemoExecution] = []
    func navigateToMemo(_ memo: Model.Memo) {
        let input: NavigateToMemoExecutionInput = memo
        let output: NavigateToMemoExecutionOutput = ()
        let execution: NavigateToMemoExecution = (input,output)
        self.navigateToMemoExecutions.append(execution)
    }
    
    typealias NavigateToCreateMemoExecutionInput = Void
    typealias NavigateToCreateMemoExecutionOutput = Void
    typealias NavigateToCreateMemoExecution = (NavigateToCreateMemoExecutionInput, NavigateToCreateMemoExecutionOutput)
    var NavigateToCreateMemoExecutions: [NavigateToCreateMemoExecution] = []
    func navigateToCreateMemo() {
        let input: NavigateToCreateMemoExecutionInput = ()
        let output: NavigateToCreateMemoExecutionOutput = ()
        let execution: NavigateToCreateMemoExecution = (input,output)
        self.NavigateToCreateMemoExecutions.append(execution)
    }
}
