//
//  MemoViewController.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/16.
//

import UIKit

protocol TestProtocol {
    func saveAction(_ sender: UIButton)
    func didChangeTextField(textField: UITextField)
}

class MemoViewController: UIViewController, TestProtocol {
    
    @IBOutlet private weak var memoTextField: UITextField!
    @IBOutlet private weak var saveButton: UIButton!
    
    private var viewModel: MemoViewModelType!
    private var memo: Model.Memo?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        configureTitleTextField()
    }
    
    func setupMemo(memo: Model.Memo?) {
        self.memo = memo
    }
    
    func initialize(viewModel: MemoViewModelType) {
        self.viewModel = viewModel
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        viewModel.action(.didTapSave)
    }
    
    private func configureTitleTextField() {
        memoTextField.addTarget(self, action: #selector(didChangeTextField(textField:)), for: .editingChanged)
    }
    
    @objc func didChangeTextField(textField: UITextField) {
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
}
