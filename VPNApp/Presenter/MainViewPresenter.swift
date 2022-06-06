//
//  MainViewPresenter.swift
//  VPNApp
//
//  Created by Jafar on 05.06.2022.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    func reloadData(string: String)
}

typealias MainViewPresenterDelegate = MainViewPresenterProtocol & SelectServerViewController

class MainViewPresenter {
    weak var delegate: MainViewPresenterDelegate?
        
    private func loading(indexPath: IndexPath) {
        self.reloadData(text:  String(indexPath.row))
    }
}

//MARK: - View
extension MainViewPresenter {
    //MARK: - Input
    open func update(indexPath: IndexPath) {
        loading(indexPath: indexPath)
    }
    //MARK: - Output
    private func reloadData(text: String) {
        delegate?.reloadData(string: text)
    }
}
