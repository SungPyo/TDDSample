//
//  MemoListViewModel.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/16.
//

import Foundation

enum MemoListViewModelAction {
    case refresh
    case didTapMemo(Model.Memo)
    case didTapAddMemo
}

protocol MemoListViewModelDelegate: class {
    func setSections(sections: [[Model.Memo]])
    func navigateToMemo(_ memo: Model.Memo)
    func navigateToCreateMemo()
}

class MemoListViewModelType: ViewModel {
    typealias Action = MemoListViewModelAction
    typealias Delegate = MemoListViewModelDelegate
    
    weak var delegate: Delegate?
    
    init() {}
    
    func action(_ action: Action) { }
}

class MemoListViewModel: MemoListViewModelType {
    private let memoService: MemoServiceProtocol
    private var memos: [Model.Memo] = [] {
        didSet { self.sections = [memos] }
    }
    private var sections: [[Model.Memo]] = [] {
        didSet { self.delegate?.setSections(sections: self.sections) }
    }
    weak override var delegate: Delegate? {
        didSet { self.setInitialState() }
    }
    
    init(memoService: MemoServiceProtocol) {
        self.memoService = memoService
        super.init()
    }
    
    private func setInitialState() {
        self.delegate?.setSections(sections: self.sections)
    }
    
    override func action(_ action: MemoListViewModelType.Action) {
        switch action {
        case .refresh:
            memoService.memos { memos in
                self.memos = memos
            }
        case .didTapAddMemo:
            self.delegate?.navigateToCreateMemo()
        case .didTapMemo(let memo):
            self.delegate?.navigateToMemo(memo)
        }
    }
}
