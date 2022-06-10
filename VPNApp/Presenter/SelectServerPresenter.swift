//
//  SelectServerPresenter.swift
//  VPNApp
//
//  Created by Jafar on 05.06.2022.
//

import Foundation

protocol SelectServerPresenterProtocol: AnyObject {
    func reloadData(string: String)
}

typealias MainViewPresenterDelegate = SelectServerPresenterProtocol & SelectServerViewController

class SelectServerPresenter {
    weak var delegate: MainViewPresenterDelegate?
        
    private func loading(indexPath: IndexPath) {
        self.reloadData(text:  String(indexPath.row))
    }
}

//MARK: - View
extension SelectServerPresenter {
    //MARK: - Input
    open func update(indexPath: IndexPath) {
        loading(indexPath: indexPath)
    }
    //MARK: - Output
    private func reloadData(text: String) {
        delegate?.reloadData(string: text)
    }
}
