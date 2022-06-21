//
//  SelectServerViewController.swift
//  VPNApp
//
//  Created by Jafar on 31.05.2022.
//

import UIKit
import SDWebImage


protocol ServerChangeDelegate {
    func changeServer(server: String)
//    func changeServer(_ sender: SelectServerViewController)
}


class SelectServerViewController: UIViewController {
    
    var delegate: ServerChangeDelegate?
    
    
    private let presenter = SelectServerPresenter()
    private var myTableView = UITableView()
    let networkService = NetworkService()
    var searchResponse: SearchResponse? = nil
    
    let headerView2 = CurrentServerCustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        title = "Выберите сервер"
        setup()
        
        let urlString = "http://89.108.83.86/vpn/api/v1/servers.php?id"
        networkService.request(urlString: urlString) { [weak self] (result) in
            switch result {
            case .success(let searchResponse):
                self?.searchResponse = searchResponse
                self?.myTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
    }
}


extension SelectServerViewController {
    
    
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myTableView)
        
        myTableView.register(SelectServerTableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        
        myTableView.separatorStyle = .none
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 110))
        header.translatesAutoresizingMaskIntoConstraints = false
        myTableView.tableHeaderView = header
        header.backgroundColor = .clear
        let headerView = UIView()
        header.addSubview(headerView)
        headerView.backgroundColor = .clear
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(headerView2)
        headerView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 110),
            
            
            headerView.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 15),
            headerView.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -15),
            headerView.topAnchor.constraint(equalTo: header.topAnchor, constant: 15),
            headerView.heightAnchor.constraint(equalToConstant: 70),
            
            headerView2.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerView2.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            headerView2.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerView2.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
        ])
        
        
        
        
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
}

extension SelectServerViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! SelectServerTableViewCell
        let topic = searchResponse?.result?[indexPath.section]
        cell.topicNameLabel.text = topic?.country
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.topicPhoto.sd_setImage(with: URL(string: topic?.image ?? ""), completed: nil)
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchResponse?.result?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 56
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        
        return headerView
    }
}


extension SelectServerViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let topic = searchResponse?.result?[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! SelectServerTableViewCell
        headerView2.viewLabel.text = "\(topic?.country ?? "")"
        if let string = topic?.image, let url = URL(string: string) {
            headerView2.imageView.sd_setImage(with: url, completed: nil)
            
        }
        
        headerView2.rightImageView.backgroundColor = .white
//        presenter.update(indexPath: indexPath)
        delegate?.changeServer(server: "\(headerView2.viewLabel.text ?? "")")
    }
    
    
}








extension SelectServerViewController: SelectServerPresenterProtocol {
    
    func reloadData(string: String) {
        
        let alert = UIAlertController(title: nil, message: string, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    
    
}
