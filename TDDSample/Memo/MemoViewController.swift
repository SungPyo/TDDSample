//
//  MemoViewController.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/16.
//

import UIKit

class MemoViewController: UIViewController {
    
    @IBOutlet private weak var memoTextField: UITextField!
    @IBOutlet private weak var saveButton: UIButton!
    
    private var viewModel: MemoViewModel!
    private var navigator: MemoNavigator!
    private var memo: Model.Memo?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        self.viewModel.delegate = self
        configureTitleTextField()
    }
    
    func setupMemo(memo: Model.Memo?) {
        self.memo = memo
    }
    
    func initialize() {
        viewModel = MemoViewModel(memoService: MemoService.shared, memo: memo)
        navigator = MemoNavigator(navigation: navigationController!)
    }
    
    @IBAction private func saveAction(_ sender: UIButton) {
        viewModel.action(.didTapSave)
    }
    
    private func configureTitleTextField() {
        memoTextField.addTarget(self, action: #selector(didChangeTextField(textField:)), for: .editingChanged)
    }
    
    @objc private func didChangeTextField(textField: UITextField) {
        viewModel.action(.inputContent(textField.text))
    }
}

extension MemoViewController: MemoViewModelDelegate {
    func setContent(_ content: String?) {
        memoTextField.text = content
    }
    
    func setSaveButtonEnabled(_ isEnabled: Bool) {
        saveButton.isEnabled = isEnabled
    }
    
    func dismiss() {
        navigator.dismiss()
    }
}
