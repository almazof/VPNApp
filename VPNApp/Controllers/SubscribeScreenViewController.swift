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
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 400))
        header.backgroundColor = appColor
        subscribeTableView.tableHeaderView = header
        
        lazy var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        
        
        lazy var backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = #colorLiteral(red: 0.4310564399, green: 0.2845467925, blue: 0.9575057626, alpha: 1)
        backgroundView.layer.cornerRadius = 15
        
        lazy var crownImageView = UIImageView()
        crownImageView.translatesAutoresizingMaskIntoConstraints = false
        
        lazy var crownImage = UIImage(named: "Vector")
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
        
        lazy var groupStackView = UIStackView()
        groupStackView.translatesAutoresizingMaskIntoConstraints = false
        groupStackView.axis = .vertical
        groupStackView.spacing = 15
        groupStackView.alignment = .fill
        groupStackView.distribution = .fillEqually
        
        
        lazy var noAd = SubscribeScreenCustomView()
        noAd.translatesAutoresizingMaskIntoConstraints = false
        noAd.imageView.image = UIImage(named: "group")
        noAd.titleLabel.text = "Никакой рекламы"
        noAd.subtitleLabel.text = "Наслаждайтесь серфингом без назойливой рекламы"
   
        lazy var connection = SubscribeScreenCustomView()
        connection.translatesAutoresizingMaskIntoConstraints = false
        connection.imageView.image = UIImage(named: "wifi")
        connection.titleLabel.text = "Стабильное соединение"
        connection.subtitleLabel.text = "Без прерываний и задержек "
        
        lazy var speed = SubscribeScreenCustomView()
        speed.translatesAutoresizingMaskIntoConstraints = false
        speed.imageView.image = UIImage(named: "lightning")
        speed.titleLabel.text = "Скорость"
        speed.subtitleLabel.text = "Увеличьте быстроту загрузки"
        
        lazy var security = SubscribeScreenCustomView()
        security.translatesAutoresizingMaskIntoConstraints = false
        security.imageView.image = UIImage(named: "shield")
        security.titleLabel.text = "Защита"
        security.subtitleLabel.text = "Безопасное подключения"
        
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)

        groupStackView.addArrangedSubview(noAd)
        groupStackView.addArrangedSubview(connection)
        groupStackView.addArrangedSubview(speed)
        groupStackView.addArrangedSubview(security)

        
        header.addSubview(backgroundView)
        header.addSubview(crownImageView)
        header.addSubview(stackView)
        header.addSubview(groupStackView)
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            backgroundView.topAnchor.constraint(equalTo: header.topAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: 65),
            backgroundView.heightAnchor.constraint(equalToConstant: 65),
            
            crownImageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            crownImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            crownImageView.widthAnchor.constraint(equalToConstant: 32),
            crownImageView.heightAnchor.constraint(equalToConstant: 32),
            
            stackView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 18),
            stackView.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 275),

            groupStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            groupStackView.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            groupStackView.widthAnchor.constraint(equalToConstant: 300),
            groupStackView.bottomAnchor.constraint(equalTo: header.bottomAnchor)
        ])
        
    }
    
    private func setupFooter() {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 173))
        footer.backgroundColor = appColor
        subscribeTableView.tableFooterView = footer
        
        lazy var buyPremium: UIButton = {
            
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0.4310564399, green: 0.2845467925, blue: 0.9575057626, alpha: 1)
            button.layer.cornerRadius = 15
            button.setTitle("Купить Premium", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
//            button.addTarget(self, action: #selector(buttonPressed(_ :)), for: .touchUpInside)

            return button
        }()
        
        lazy var restorePurchasesLabel: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Восстановить покупки"
            label.alpha = 0.6
            label.font = UIFont(name: "Montserrat-Medium", size: 14)
            
            
          return label
        }()
        
        footer.addSubview(buyPremium)
        footer.addSubview(restorePurchasesLabel)
        
        
        NSLayoutConstraint.activate([
            buyPremium.topAnchor.constraint(equalTo: footer.topAnchor, constant: 35),
            buyPremium.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 16),
            buyPremium.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -16),
            buyPremium.heightAnchor.constraint(equalToConstant: 59),
            
            restorePurchasesLabel.topAnchor.constraint(equalTo: buyPremium.bottomAnchor, constant: 13),
            restorePurchasesLabel.centerXAnchor.constraint(equalTo: footer.centerXAnchor),
            restorePurchasesLabel.widthAnchor.constraint(equalToConstant: 168),
            restorePurchasesLabel.heightAnchor.constraint(equalToConstant: 17)
            
            
            
        ])
        
        
        
    }
    
}

extension SubscribeScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
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
