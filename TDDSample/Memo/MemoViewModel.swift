//
//  MemoViewModel.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/17.
//

import Foundation

enum MemoViewModelAction {
    case inputContent(String?)
    case didTapSave
}

protocol MemoViewModelDelegate: class {
    func setContent(_ content: String?)
    func setSaveButtonEnabled(_ isEnabled: Bool)
}

class MemoViewModelType: ViewModel {
    
    typealias Action = MemoViewModelAction
    typealias Delegate = MemoViewModelDelegate
    
    weak var delegate: Delegate?
    
    init(memo: Model.Memo?) { }
    
    func action(_ action: Action) { }
}

class MemoViewModel: MemoViewModelType {
    private let memoService: MemoServiceProtocol
    weak var coordinator: MemoCoordinatorProtocol?
    private var memo: Model.Memo?
    private var content: String? {
        didSet {
            self.delegate?.setContent(self.content)
            self.updateSaveButtonEnabled()
        }
    }
    
    private var isSaveButtonEnabled: Bool = false {
        didSet { self.delegate?.setSaveButtonEnabled(self.isSaveButtonEnabled) }
    }
    
//    weak override var delegate: Delegate?
//    {
//        didSet { self.setInitialState() }
//    }
    
    init(memoService: MemoServiceProtocol,
         memo: Model.Memo?,
         coordinator: MemoCoordinatorProtocol?) {
        self.coordinator = coordinator
        self.memoService = memoService
        self.memo = memo
        self.content = memo?.content
        super.init(memo: memo)
    }
    
    private func setInitialState() {
//        self.delegate?.setContent(self.content)
        self.updateSaveButtonEnabled()
    }
    
    private func updateSaveButtonEnabled() {
        self.isSaveButtonEnabled = !(self.content?.isEmpty ?? true)
    }
    
    override func action(_ action: MemoViewModelType.Action) {
        switch action {
        case .didTapSave:
//            guard let content = self.content else { return }
            if let memo = self.memo {
                memoService.updateMemo(memo: Model.Memo(id: memo.id, content: memo.content))
            } else {
                memoService.addMemo(content: (memo?.content) ?? "")
            }
            coordinator?.dismiss()
        case .inputContent(let content):
            self.content = content
        }
    }
}
