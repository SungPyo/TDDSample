//
//  MemoService.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/17.
//

import Foundation

protocol MemoServiceProtocol {
    func memos(completion: @escaping ([Model.Memo]) -> ())
    func addMemo(content: String)
    func updateMemo(memo: Model.Memo)
}

final class MemoService: MemoServiceProtocol {

    static let shared: MemoService = MemoService()
    private var lastMemoID = 0
    private var datas: [Model.Memo] = []
    
    private init() {}
    
    func memos(completion: @escaping ([Model.Memo]) -> ()) {
        completion(datas)
    }
    func addMemo(content: String) {
        lastMemoID += 1
        let memo = Model.Memo(id: lastMemoID, content: content)
        self.datas.append(memo)
    }
    
    func updateMemo(memo: Model.Memo) {
        guard let index = self.datas.firstIndex(where: { $0.id == memo.id }) else { return }
        self.datas[index] = memo
    }
}
