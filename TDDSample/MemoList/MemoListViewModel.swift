//
//  MemoListViewModel.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/16.
//

import Foundation

//뷰에서 발생되는 액션?
enum MemoListViewModelAction: Equatable {
    case didTapAddMemo //+버튼 눌렀을때
    case didTapMemo(Model.Memo) //셀 선택할때
    case refresh
}

protocol MemoListViewModelDelegate: class {
    func setSections(sections: [[Model.Memo]])
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
    weak var coordinator: MemoListCoordinator?
    
    private var memos: [Model.Memo] = [] {
        didSet { self.sections = [memos] }
    }
    private var sections: [[Model.Memo]] = [] {
        didSet { self.delegate?.setSections(sections: self.sections) }
    }
    
    init(memoService: MemoServiceProtocol,
         coordinator: MemoListCoordinator) {
        self.memoService = memoService
        self.coordinator = coordinator
        super.init()
    }
        
    override func action(_ action: MemoListViewModelType.Action) {
        switch action {
        case .refresh:
            memoService.memos { memos in
                self.memos = memos
            }
        case .didTapAddMemo:
            coordinator?.navigateToMemo(memo: nil)
        case .didTapMemo(let memo):
            coordinator?.navigateToMemo(memo: memo)
        }
    }
}
