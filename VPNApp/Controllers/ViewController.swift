//
//  ViewController.swift
//  VPNApp
//
//  Created by Zugra Rakhmatullina on 04.07.2022.
//

import Foundation

import UIKit

class ViewController: UIViewController {
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView(image: UIImage.init(named: "map"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func loadView() {
        super.loadView()
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 3)
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appColor
        navigationItem.backButtonDisplayMode = .minimal
    }
}
