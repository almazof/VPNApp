//
//  SubscribeScreenViewController.swift
//  VPNApp
//
//  Created by Jafar on 21.06.2022.
//


import UIKit

class SubscribeScreenViewController: UIViewController {
    
    private lazy var subscribeTableView = UITableView()
    
    struct CellModel {
        let month: String
        let discount: String
        let price: String
    }
    
    
    let articles: [CellModel] = [
        CellModel(month: "1 месяц", discount: "Полная стоимость", price: "350,00 ₽"),
        CellModel(month: "6 месяцев", discount: "35% скидка", price: "1500,00 ₽"),
        CellModel(month: "12 месяцев", discount: "50% скидка", price: "2000,00 ₽")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appColor
        setup()
        
    }
    
}

extension SubscribeScreenViewController {
    
    private func setup() {
        
        setupSubscribeTableView()
        setupHeader()
        setupFooter()
    
    }
    
    private func setupSubscribeTableView() {
        subscribeTableView.backgroundColor = appColor
        
        subscribeTableView.delegate = self
        subscribeTableView.dataSource = self
        
        subscribeTableView.register(SubscribeCell.self, forCellReuseIdentifier: SubscribeCell.reuseID)
        subscribeTableView.separatorStyle = .none
        
        subscribeTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subscribeTableView)
        
        NSLayoutConstraint.activate([
            subscribeTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            subscribeTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            subscribeTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            subscribeTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
        
    }
    
    private func setupHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 372))
        header.backgroundColor = appColor
        subscribeTableView.tableHeaderView = header
        
        lazy var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        
        
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .purple
        backgroundView.layer.cornerRadius = 15
        
        let crownImageView = UIImageView()
        crownImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let crownImage = UIImage(named: "Vector")
        crownImageView.image = crownImage
        
        lazy var titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Приобретите Premium-версию"
        titleLabel.font = UIFont(name: "Montserrat-Bold", size: 16)
        
        lazy var subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = "Никаких обязательств. Отмена в любое время."
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.alpha = 0.6
        subtitleLabel.font = UIFont(name: "Montserrat-Regular", size: 10)
        
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)

        
        header.addSubview(backgroundView)
        header.addSubview(crownImageView)
        header.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            backgroundView.topAnchor.constraint(equalTo: header.topAnchor, constant: 61),
            backgroundView.widthAnchor.constraint(equalToConstant: 65),
            backgroundView.heightAnchor.constraint(equalToConstant: 65),
            
            crownImageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            crownImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            crownImageView.widthAnchor.constraint(equalToConstant: 32),
            crownImageView.heightAnchor.constraint(equalToConstant: 32),
            
            stackView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 18),
            stackView.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 275),
//            stackView.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 85),
//            stackView.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -85),
//
            

        ])
        
    }
    
    private func setupFooter() {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 173))
        footer.backgroundColor = .orange
        subscribeTableView.tableFooterView = footer
    }
    
}

extension SubscribeScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
//
    }
}

extension SubscribeScreenViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: SubscribeCell.reuseID, for: indexPath) as! SubscribeCell
        let articl = articles[indexPath.row]
        
        cell.monthLabel.text = articl.month
        cell.discountLabel.text = articl.discount
        cell.priceLabel.text = articl.price
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }
    
}
