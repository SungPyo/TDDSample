//
//  MemoListViewControllerTests.swift
//  TDDSampleTests
//
//  Created by Pyo Cho on 2021/03/17.
//

import XCTest
@testable import TDDSample

class MemoListViewControllerTests: XCTestCase {
    var viewModel: MemoListViewModelStub!
    var navigator: MemoListViewNavigatorStub!
    var viewController: MemoListViewController! //Test

    override func setUp() {
        super.setUp()
        initialize()
    }
    
    func initialize() {
        viewModel = MemoListViewModelStub()
        navigator = MemoListViewNavigatorStub()
        let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Navigation") as! UINavigationController
        navigation.loadViewIfNeeded()
        viewController = navigation.viewControllers.first as? MemoListViewController
        viewController.initialize(viewModel: viewModel, navigator: navigator)
        viewController.loadViewIfNeeded()
    }
    
    func test_메모_추가_버튼을_누르면_didTapAddMemo액션이_발행됩니다() {
        //when
        viewController.addMemo(UIBarButtonItem())
        //then
        XCTAssertEqual(viewModel.actionExecutions.count, 1)
    }
    
    func test_리스트를_표시_할_수_있습니다() {
        let mi = Mirror(reflecting: viewController!)
        let tableView = mi.children.first(where: {$0.label == "tableView"})?.value as! UITableView //private Variable
        
        let memo = Model.Memo(id: 1, content: "12345")
        viewModel.delegate?.setSections(sections: [[memo]])
        
        let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(item: 0, section: 0))
        XCTAssertTrue(cell?.textLabel?.text == "12345")
    }
    
    func test_메모_생성_화면으로_이동_할_수_있습니다() {
        //액션 발행시 navigator입력이 올바르게 됐는지 테스트
        //when
        viewModel.delegate?.navigateToCreateMemo()
        
        //then
        XCTAssertEqual(navigator.navigateToCreateMemoExecutions.count, 1)
    }
    
    func test_메모_수정_화면으로_이동_할_수_있습니다() {
        //액션 발행시 navigator입력이 올바르게 됐는지 테스트
        //given
        let memo = Model.Memo(id: 123, content: "456789")
        
        //when
        viewModel.delegate?.navigateToMemo(memo)
        
        //then
        XCTAssertEqual(navigator.navigateToMemoExecutions.count, 1)
        XCTAssertEqual(navigator.navigateToMemoExecutions[0].0, memo)
    }
    
    func test_viewWillAppear가_호출되면_refresh액션이_발행됩니다() {
        //given
        let refresh = MemoListViewModelType.Action.refresh
        
        //when
        viewController.viewWillAppear(true)
        
        //then
        let refreshExecutions = viewModel.actionExecutions[0].0
        XCTAssertEqual(refresh, refreshExecutions)
    }
}
