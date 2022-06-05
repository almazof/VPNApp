//
//  MainTableViewCell.swift
//  VPNApp
//
//  Created by Jafar on 31.05.2022.
//

import UIKit
import SDWebImage

class MainTableViewCell: UITableViewCell {
    let networkService = NetworkService()
    
    var searchResponse: SearchResponse? = nil
    
    
    var backView: UIView = {
        var view = UIView(frame: CGRect(x: 10, y: 0, width: 370, height: 60))
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    
    let topicPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let topicNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Medium", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let timeDelayLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 10))
        label.font = UIFont(name: "Montserrat-Medium", size: 8)
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 0.4
        label.attributedText = NSMutableAttributedString(string: "Временная задержка: 8ms", attributes: [NSAttributedString.Key.kern: 0.08])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let ellipseImg: UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = .lightGray
        imageView.image = UIImage(systemName: "circle")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = false
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.clipsToBounds = true
//        self.layer.borderWidth = 0.1
//        self.accessoryType = .none
        self.textLabel?.numberOfLines = .zero
        self.textLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 40)
//        self.contentView.backgroundColor = .blue
        addSubview(backView)
        addSubview(topicPhoto)
        addSubview(topicNameLabel)
        addSubview(timeDelayLabel)
        addSubview(ellipseImg)
        configureImage()
        configureLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureImage() {
        
        
        NSLayoutConstraint.activate([
            topicPhoto.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            topicPhoto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            topicPhoto.heightAnchor.constraint(equalToConstant: 39),
            topicPhoto.widthAnchor.constraint(equalToConstant: 39),
//

            
        ])
    }
    
    private func configureLabel() {
        
        NSLayoutConstraint.activate([
//            topicNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            topicNameLabel.leadingAnchor.constraint(equalTo: topicPhoto.trailingAnchor, constant: 13),
            topicNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 9),
            
            timeDelayLabel.leadingAnchor.constraint(equalTo: topicPhoto.trailingAnchor, constant: 13),
            timeDelayLabel.topAnchor.constraint(equalTo: topicNameLabel.bottomAnchor, constant: 3),
            timeDelayLabel.heightAnchor.constraint(equalToConstant: 10),
            timeDelayLabel.widthAnchor.constraint(equalToConstant: 120),
            
            ellipseImg.heightAnchor.constraint(equalToConstant: 20),
            ellipseImg.widthAnchor.constraint(equalToConstant: 20),
            ellipseImg.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ellipseImg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -19)
        ])
        
        
    }
    
    
    
}

        

