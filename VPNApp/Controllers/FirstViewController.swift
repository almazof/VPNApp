//
//  FirstViewController.swift
//  VPNApp
//
//  Created by Jafar on 30.05.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    let chooseSeverButton: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 15
        button.setTitle("Выберите сервер", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed(_ :)), for: .touchUpInside)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButtonDisplayMode = .minimal

        view.addSubview(chooseSeverButton)
        configureButton()
        
    }
    
    private func configureButton() {
        NSLayoutConstraint.activate([
            chooseSeverButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chooseSeverButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseSeverButton.heightAnchor.constraint(equalToConstant: 80),
            chooseSeverButton.widthAnchor.constraint(equalToConstant: 350)
            
        ])
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
                    
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        
        navigationController?.pushViewController(mainVC, animated: true)
    
    }
}

