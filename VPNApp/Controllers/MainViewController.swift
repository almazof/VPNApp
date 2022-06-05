//
//  MainViewController.swift
//  VPNApp
//
//  Created by Jafar on 31.05.2022.
//

import UIKit
import SDWebImage

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MainViewPresenterProtocol {
    
    private let presenter = MainViewPresenter()
    
    private var myTableView: UITableView!
    let networkService = NetworkService()
    var searchResponse: SearchResponse? = nil
    
    let customView = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        
        view.backgroundColor = .systemGray6
        title = "Выберите сервер"
        view.addSubview(customView)
        setupTableView()
        setupCustomView()
        
        
        
        
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
    
    func setupTableView() {
        
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: 210, width: displayWidth, height: displayHeight))
        myTableView.backgroundColor = .systemGray6
        myTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.rowHeight = 50
        myTableView.dataSource = self
        myTableView.delegate = self
        view.addSubview(myTableView)
        
        NSLayoutConstraint.activate([
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
            
            

        ])
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        56
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchResponse?.result?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MainTableViewCell
        let topic = searchResponse?.result?[indexPath.section]
        cell.topicNameLabel.text = topic?.country
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.topicPhoto.sd_setImage(with: URL(string: topic?.image ?? ""), completed: nil)
        cell.backgroundColor = .white
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = .systemGray6
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let topic = searchResponse?.result?[indexPath.section]
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! MainTableViewCell
        customView.viewLabel.text = "\(topic?.country ?? "")"
//        customView.customViewPhoto.image = UIImage(named: )
        customView.rightImageView.backgroundColor = .white
        presenter.update(indexPath: indexPath)
        
        
    }
  
    func setupCustomView() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customView.heightAnchor.constraint(equalToConstant: 70),
            customView.widthAnchor.constraint(equalToConstant: 345),
            customView.topAnchor.constraint(equalTo: view.topAnchor, constant: 127),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),


        ])
    }
    
    func reloadData(string: String) {
        let alert = UIAlertController(title: nil, message: string, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
}

