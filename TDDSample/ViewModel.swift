//
//  ViewModel.swift
//  TDDSample
//
//  Created by Pyo Cho on 2021/03/17.
//

import Foundation

protocol ViewModel: class {
    associatedtype Action
    associatedtype Delegate
    
    var delegate: Delegate? { get set }
    
    func action(_ action: Action)
}
