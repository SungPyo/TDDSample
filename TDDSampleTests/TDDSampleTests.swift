//
//  TDDSampleTests.swift
//  TDDSampleTests
//
//  Created by Pyo Cho on 2021/03/16.
//

import XCTest
@testable import TDDSample

class TDDSampleTests: XCTestCase {
    
    var viewModel: MemoListViewModel!
    var viewController: MemoListViewController!

    override func setUp() {
        super.setUp()
        initialize()
    }
    
    func initialize() {
        
    }
    
    func test_테스트() {
        XCTAssertTrue(true)
    }

}
