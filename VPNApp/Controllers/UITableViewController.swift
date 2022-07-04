//
//  UITableViewController.swift
//  VPNApp
//
//  Created by Zugra Rakhmatullina on 04.07.2022.
//

import UIKit

class UITableViewController: ViewController, UITableViewDelegate, UITableViewDataSource{
    lazy var tableView: UITableView = UITableView()
    
    override func loadView() {
        super.loadView()
        initialize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appColor
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
    }
    
    
    private func initialize() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        tableView.separatorStyle = .none
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
    func setupHeader(headerView: UIView, height:CGFloat) {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: height))
        tableView.tableHeaderView = header
        header.backgroundColor = .clear
        header.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: header.topAnchor),
            headerView.bottomAnchor.constraint(equalTo: header.bottomAnchor),
            headerView.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}


//MARK: - OPEN class func

extension UITableViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 0 }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { return UITableViewCell() }
    func numberOfSections(in tableView: UITableView) -> Int { return 0}
    
    @objc open func refresh(_ sender: UIRefreshControl) { }
}
