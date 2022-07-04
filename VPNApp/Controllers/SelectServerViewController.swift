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


class SelectServerViewController: UITableViewController {
    var delegate: ServerChangeDelegate?
    
    private let presenter = SelectServerPresenter()
    let networkService = NetworkService()
    var searchResponse: SearchResponse? = nil
    
    let headerView2 = CurrentServerCustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        title = "Выберите сервер"
        setup()
        
        let urlString = "http://89.108.83.86/vpn/api/v1/servers.php?id"
        networkService.request(urlString: urlString) { [weak self] (result) in
            switch result {
            case .success(let searchResponse):
                self?.searchResponse = searchResponse
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
    }
}


extension SelectServerViewController {
    
    private func setup() {
        tableView.register(SelectServerTableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        let headerView = UIView()
        headerView.backgroundColor = .clear
//        headerView.addSubview(headerView2)
//        headerView2.translatesAutoresizingMaskIntoConstraints = false
        setupHeader(headerView: headerView, height: 110)
        
//        NSLayoutConstraint.activate([
//            headerView2.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
//            headerView2.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
//            headerView2.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
//            headerView2.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
//        ])
    }
    
}

//MARK: - DataSource
extension SelectServerViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! SelectServerTableViewCell
        let topic = searchResponse?.result?[indexPath.section]
        cell.topicNameLabel.text = topic?.country
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.topicPhoto.sd_setImage(with: URL(string: topic?.image ?? ""), completed: nil)
        cell.backgroundColor = .white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
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


extension SelectServerViewController {
    
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
