//
//  SettingsViewController.swift
//  VPNApp
//
//  Created by Jafar on 14.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settingsTableView = UITableView()
    var headerView2 = PremiumSubscriptionCustomView()
    
    private lazy var buyPremiumButton: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed(_ :)), for: .touchUpInside)

        return button
    }()
    
    var data: [[SettingsCell.ViewModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .appColor
        title = "Настройки"

    }
}

extension SettingsViewController {
    
    private func setup() {
        setupSettingsTableView()
        setupFooterTableView()
        fetchData()
        
    
    }
    
    private func setupSettingsTableView() {
        settingsTableView.backgroundColor = .appColor
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        settingsTableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseID)
        settingsTableView.separatorStyle = .none
        
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsTableView)
        
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        ])
        
    }
    
    private func setupHeaderTableView() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        header.backgroundColor = .orange
        settingsTableView.tableHeaderView = header
    }
    
    private func setupFooterTableView() {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        footer.backgroundColor = .appColor
        settingsTableView.tableFooterView = footer

        let footerView = UIView()
        footer.addSubview(footerView)
        footerView.backgroundColor = .clear
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(headerView2)
        footer.addSubview(buyPremiumButton)
        headerView2.translatesAutoresizingMaskIntoConstraints = false
        
        let footerVPNView = UIImageView()
        footer.addSubview(footerVPNView)
        footerVPNView.backgroundColor = .clear
        footerVPNView.translatesAutoresizingMaskIntoConstraints = false
        
        let vpnImage = UIImage(named: "logo@2x")
        footerVPNView.image = vpnImage
        
        let footerTitleLabel: UILabel = {
            let label = UILabel()
            label.alpha = 0.65
            label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            label.font = UIFont(name: "Montserrat-ExtraBold", size: 15)
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.23
            label.textAlignment = .center
            label.attributedText = NSMutableAttributedString(string: "2022 VPN PRO", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let footerSubtitleLabel: UILabel = {
            let label = UILabel()
            label.alpha = 0.65
            label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
            label.font = UIFont(name: "Montserrat-Medium", size: 8)
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 2.31
            label.attributedText = NSMutableAttributedString(string: "Все права защищены", attributes: [NSAttributedString.Key.kern: 0.08])
            label.textColor = .black
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
        let footerStackView: UIStackView = {
            
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.spacing = 1
            
            return stackView
        }()
        
        footerStackView.addArrangedSubview(footerTitleLabel)
        footerStackView.addArrangedSubview(footerSubtitleLabel)
        
        footer.addSubview(footerStackView)
        
        
        
        NSLayoutConstraint.activate([
            footerView.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 15),
            footerView.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -15),
            footerView.topAnchor.constraint(equalTo: footer.topAnchor, constant: 15),
            footerView.heightAnchor.constraint(equalToConstant: 70),
            
            headerView2.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            headerView2.trailingAnchor.constraint(equalTo: footerView.trailingAnchor),
            headerView2.topAnchor.constraint(equalTo: footerView.topAnchor),
            headerView2.bottomAnchor.constraint(equalTo: footerView.bottomAnchor),
            
            footerVPNView.topAnchor.constraint(equalTo: footerView.bottomAnchor, constant: 42),
            footerVPNView.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            footerVPNView.widthAnchor.constraint(equalToConstant: 79),
            footerVPNView.heightAnchor.constraint(equalToConstant: 79),
            
            footerStackView.topAnchor.constraint(equalTo: footerVPNView.bottomAnchor, constant: 19),
            footerStackView.centerXAnchor.constraint(equalTo: footerVPNView.centerXAnchor),
            
            
            buyPremiumButton.topAnchor.constraint(equalTo: headerView2.topAnchor),
            buyPremiumButton.leadingAnchor.constraint(equalTo: headerView2.leadingAnchor),
            buyPremiumButton.trailingAnchor.constraint(equalTo: headerView2.trailingAnchor),
            buyPremiumButton.bottomAnchor.constraint(equalTo: headerView2.bottomAnchor)
            
            
        ])
        
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard !data.isEmpty else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseID, for: indexPath) as! SettingsCell
        
        let cells = data[indexPath.section][indexPath.row]
        
        cell.configure(with: cells)
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 66
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 91
        } else {
            return 40
        }
    }
    
}


extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
}


extension SettingsViewController {
    private func fetchData() {
        
        
        let cell1 = [SettingsCell.ViewModel(cellType: .Account, cellName: "Аккаунт:")]
        let cell2 = [SettingsCell.ViewModel(cellType: .Notifications, cellName: "Уведомления"), SettingsCell.ViewModel(cellType: .Contact, cellName: "Связаться с нами"), SettingsCell.ViewModel(cellType: .Privacy, cellName: "Политика конфиденциальности")]
    
        data.append(cell1)
        data.append(cell2)
   
    }
}

extension SettingsViewController {
    
@objc func buttonPressed(_ sender: UIButton) {
    
    let subscribeVC = SubscribeScreenViewController()
        
    subscribeVC.modalPresentationStyle = .fullScreen
    navigationController?.pushViewController(subscribeVC, animated: true)


     }
}

