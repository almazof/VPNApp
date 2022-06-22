//
//  FirstViewController.swift
//  VPNApp
//
//  Created by Jafar on 30.05.2022.
//

import UIKit



class FirstViewController: UIViewController, ServerChangeDelegate {
//    func changeServer(_ sender: SelectServerViewController) {
//        <#code#>
//    }
    
 
    
    let chooseSeverButton: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.4310564399, green: 0.2845467925, blue: 0.9575057626, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitle("Выберите сервер", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed(_ :)), for: .touchUpInside)

        return button
    }()
    
    let currentServerLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        label.text = "Current server"
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButtonDisplayMode = .minimal

        
        view.addSubview(chooseSeverButton)
        view.addSubview(currentServerLabel)
        configureButton()
        
        
    }
    
    func changeServer(server: String) {
        currentServerLabel.text = server
    }
    
    
    private func configureButton() {
        NSLayoutConstraint.activate([
            chooseSeverButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chooseSeverButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseSeverButton.heightAnchor.constraint(equalToConstant: 80),
            chooseSeverButton.widthAnchor.constraint(equalToConstant: 350),
            
            currentServerLabel.bottomAnchor.constraint(equalTo: chooseSeverButton.topAnchor, constant: -24),
            currentServerLabel.leadingAnchor.constraint(equalTo: chooseSeverButton.leadingAnchor),
            currentServerLabel.trailingAnchor.constraint(equalTo: chooseSeverButton.trailingAnchor),
            currentServerLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    

    
    @objc func buttonPressed(_ sender: UIButton) {
                    
        let mainVC = SelectServerViewController()
        
        mainVC.delegate = self
        
        mainVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(mainVC, animated: true)
        
    }
}

