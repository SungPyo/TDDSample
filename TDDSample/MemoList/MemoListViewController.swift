//
//  ViewController.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/16.
//

import UIKit

class MemoListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var sections: [[Model.Memo]] = [] {
        didSet { self.tableView.reloadData() }
    }
    
    private var viewModel: MemoListViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    @IBAction func addMemo(_ sender: UIBarButtonItem) {
        self.viewModel.action(.didTapAddMemo)
    }
    
    func initialize(viewModel: MemoListViewModelType) {
        self.viewModel = viewModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.action(.refresh)
    }
}

extension MemoListViewController: MemoListViewModelDelegate {
    func setSections(sections: [[Model.Memo]]) {
        self.sections = sections
    }
}

extension MemoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = sections[indexPath.section][indexPath.item]
        self.viewModel.action(.didTapMemo(item))
    }
}

extension MemoListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.sections[indexPath.section][indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = item.content
        return cell
    }
}

