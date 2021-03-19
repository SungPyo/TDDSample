//
//  MemoListViewControllerTests.swift
//  TDDSampleTests
//
//  Created by Pyo Cho on 2021/03/17.
//

import XCTest
@testable import TDDSample

class MemoListViewControllerTests: XCTestCase {
    private var viewModel: MemoListViewModelStub!
    private var coordinator: MemoListViewCoordinatorStub!
    private var viewController: MemoListViewController! //Test

    override func setUp() {
        super.setUp()
        initialize()
    }
    
    private func initialize() {
        viewModel = MemoListViewModelStub()
        let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainContainer") as! UINavigationController
        navigation.loadViewIfNeeded()
        viewController = navigation.viewControllers.first as? MemoListViewController
        coordinator = MemoListViewCoordinatorStub()
        viewController.initialize(viewModel: viewModel)
        viewController.loadViewIfNeeded()
    }
    
    func test_메모_추가_버튼을_누르면_didTapAddMemo액션이_발행됩니다() {
        //when
        viewController.addMemo(UIBarButtonItem())
        //then
        XCTAssertEqual(viewModel.actionExecutions.count, 1)
    }

    func test_리스트를_표시_할_수_있습니다() {
        //given
        let mi = Mirror(reflecting: viewController!)
        let tableView = mi.children.first(where: {$0.label == "tableView"})?.value as! UITableView //private Variable
        let memo = Model.Memo(id: 1, content: "12345")
        
        //when
        viewModel.delegate?.setSections(sections: [[memo]])

        //then
        let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(item: 0, section: 0))
        XCTAssertTrue(cell?.textLabel?.text == "12345")
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
