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
    
    var data: [[SettingsCell.ViewModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = appColor
        title = "Настройки"
    }
}

extension SettingsViewController {
    private func setup() {
        setupSettingsTableView()
        //        setupHeaderTableView()
        setupFooterTableView()
        fetchData()
    }
    
    private func setupSettingsTableView() {
        settingsTableView.backgroundColor = appColor
        
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
            settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    private func setupHeaderTableView() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        header.backgroundColor = .orange
        settingsTableView.tableHeaderView = header
    }
    
    private func setupFooterTableView() {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        footer.backgroundColor = appColor
        settingsTableView.tableFooterView = footer

        let headerView = UIView()
        footer.addSubview(headerView)
        headerView.backgroundColor = .clear
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(headerView2)
        headerView2.translatesAutoresizingMaskIntoConstraints = false
        
        let headerVPNView = UIImageView()
        footer.addSubview(headerVPNView)
        headerVPNView.backgroundColor = .clear
        headerVPNView.translatesAutoresizingMaskIntoConstraints = false
        
        let vpnImage = UIImage(named: "logo@2x")
        headerVPNView.image = vpnImage
        
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
            headerView.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 15),
            headerView.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -15),
            headerView.topAnchor.constraint(equalTo: footer.topAnchor, constant: 15),
            headerView.heightAnchor.constraint(equalToConstant: 70),
            
            headerView2.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerView2.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            headerView2.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerView2.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            
            headerVPNView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 42),
            headerVPNView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerVPNView.widthAnchor.constraint(equalToConstant: 79),
            headerVPNView.heightAnchor.constraint(equalToConstant: 79),
            
            footerStackView.topAnchor.constraint(equalTo: headerVPNView.bottomAnchor, constant: 19),
            footerStackView.centerXAnchor.constraint(equalTo: headerVPNView.centerXAnchor),
            
            
            
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
        for family in UIFont.familyNames.sorted() {
          let names = UIFont.fontNames(forFamilyName: family)
          print("Family: \(family) Font names: \(names)")
        }

    }
    
}


extension SettingsViewController {
    private func fetchData() {
        
        
        let cell1 = [SettingsCell.ViewModel(cellType: .Account, cellName: "Аккаунт")]
        let cell2 = [SettingsCell.ViewModel(cellType: .Notifications, cellName: "Уведомления"), SettingsCell.ViewModel(cellType: .Contact, cellName: "Связаться с нами"), SettingsCell.ViewModel(cellType: .Privacy, cellName: "Политика конфиденциальности")]
    
        data.append(cell1)
        data.append(cell2)
   
    }
}
