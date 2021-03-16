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
    func dismiss()
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
    private var memoID: Int?
    private var content: String? {
        didSet {
            self.delegate?.setContent(self.content)
            self.updateSaveButtonEnabled()
        }
    }
    
    private var isSaveButtonEnabled: Bool = false {
        didSet { self.delegate?.setSaveButtonEnabled(self.isSaveButtonEnabled) }
    }
    
    weak override var delegate: Delegate? {
        didSet { self.setInitialState() }
    }
    
    init(memoService: MemoServiceProtocol, memo: Model.Memo?) {
        self.memoService = memoService
        self.memoID = memo?.id
        self.content = memo?.content
        super.init(memo: memo)
    }
    
    private func setInitialState() {
        self.delegate?.setContent(self.content)
        self.updateSaveButtonEnabled()
    }
    
    private func updateSaveButtonEnabled() {
        self.isSaveButtonEnabled = !(self.content?.isEmpty ?? true)
    }
    
    override func action(_ action: MemoViewModelType.Action) {
        switch action {
        case .didTapSave:
            guard let content = self.content else { return }
            if let memoID = self.memoID {
                memoService.updateMemo(memo: Model.Memo(id: memoID, content: content))
            } else {
                memoService.addMemo(content: content)
            }
            self.delegate?.dismiss()
        case .inputContent(let content):
            self.content = content
        }
    }
}
