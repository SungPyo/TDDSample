//
//  MemoViewControllerTests.swift
//  TDDSampleTests
//
//  Created by Pyo Cho on 2021/03/18.
//

import Foundation

import XCTest
@testable import TDDSample

class MemoViewControllerTests: XCTestCase {
    
//    var memoViewModel: MemoViewModelStub!
//    var memoViewNavigator: MemoViewNavigatorStub!
//    var memoViewController: MemoViewController! //test
//
//    override func setUp() {
//        super.setUp()
//        initialize()
//    }
//
//    private func initialize() {
//        memoViewModel = MemoViewModelStub(memo: nil)
//        memoViewNavigator = MemoViewNavigatorStub()
//
//        let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Navigation") as! UINavigationController
//
//        let memoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MemoViewController") as! MemoViewController
//        navigation.setViewControllers([memoViewController], animated: true)
//        memoViewController.initialize(viewModel: memoViewModel,
//                                      navigator: memoViewNavigator)
//        self.memoViewController = memoViewController
//        self.memoViewController.loadViewIfNeeded()
//    }
//
//    func test_Button을_누르면_didTapSave_액션이_발행됩니다() {
//        //when
//        memoViewController.saveAction(UIButton())
//
//        //then
//        XCTAssertEqual(memoViewModel.actionExcutions.count, 1)
//    }
//
//    func test_textField에_텍스트가_입력되면_inputContent_액션이_발행됩니다() {
//        //given
//        let textField = Mirror(reflecting: memoViewController!)
//            .children.first(where: {$0.label == "memoTextField"})?.value as! UITextField
//
//        //when
//        memoViewController.didChangeTextField(textField: textField)
//
//        //then
//        XCTAssertEqual(memoViewModel.actionExcutions.count, 1)
//    }
}

