//
//  SelectServerTableViewCell.swift
//  VPNApp
//
//  Created by Jafar on 31.05.2022.
//

import UIKit
import SDWebImage

class SelectServerTableViewCell: UITableViewCell {
    
    let networkService = NetworkService()
    var searchResponse: SearchResponse? = nil
    
    let blankView = UIView()
    lazy var topicPhoto = UIImageView()
    lazy var topicNameLabel = UILabel()
//    lazy var topicStackView = UIStackView()
    private lazy var timeDelayLabel = UILabel()
    private lazy var ellipseImg = UIImageView()
  

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
        
        self.backgroundColor = .clear
        contentView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    extension SelectServerTableViewCell {
        private func setup() {
            blankView.translatesAutoresizingMaskIntoConstraints = false
            blankView.backgroundColor = .white
            blankView.layer.cornerRadius = 15
            
            topicPhoto.translatesAutoresizingMaskIntoConstraints = false
            topicPhoto.backgroundColor = .cyan
            topicPhoto.layer.cornerRadius = 15
            topicPhoto.clipsToBounds = false
            
//            topicStackView.translatesAutoresizingMaskIntoConstraints = false
//            topicStackView.axis = .vertical
////            topicStackView.backgroundColor = .systemMint
////            topicStackView.alignment = .fill
//            topicStackView.spacing = 0
            
            topicNameLabel.translatesAutoresizingMaskIntoConstraints = false
            topicNameLabel.font = UIFont(name: "Montserrat-Medium", size: 15)
            
            timeDelayLabel.translatesAutoresizingMaskIntoConstraints = false
            timeDelayLabel.font = UIFont(name: "Montserrat-Medium", size: 8)
            timeDelayLabel.adjustsFontSizeToFitWidth = true
            timeDelayLabel.alpha = 0.4
            timeDelayLabel.attributedText = NSMutableAttributedString(string: "Временная задержка: 8ms", attributes: [NSAttributedString.Key.kern: 0.08])
            
            ellipseImg.translatesAutoresizingMaskIntoConstraints = false
            ellipseImg.image = UIImage(systemName: "circle")
            ellipseImg.layer.cornerRadius = 5
            ellipseImg.clipsToBounds = false
            ellipseImg.tintColor = .black
          
            
            blankView.addSubview(topicPhoto)
            blankView.addSubview(topicNameLabel)
            blankView.addSubview(timeDelayLabel)
            blankView.addSubview(topicNameLabel)
            blankView.addSubview(timeDelayLabel)
//            blankView.addSubview(topicStackView)
            blankView.addSubview(ellipseImg)
            
            
            contentView.addSubview(blankView)
           
        }
        private func layout() {
            NSLayoutConstraint.activate([
                blankView.topAnchor.constraint(equalTo: topAnchor),
                blankView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
                trailingAnchor.constraint(equalToSystemSpacingAfter: blankView.trailingAnchor, multiplier: 1),
                blankView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                topicPhoto.centerYAnchor.constraint(equalTo: blankView.centerYAnchor),
                topicPhoto.leadingAnchor.constraint(equalTo: blankView.leadingAnchor, constant: 15),
                topicPhoto.heightAnchor.constraint(equalToConstant: 32),
                topicPhoto.widthAnchor.constraint(equalToConstant: 32),
                
                topicNameLabel.topAnchor.constraint(equalTo: blankView.topAnchor, constant: 9),
                topicNameLabel.leadingAnchor.constraint(equalTo: topicPhoto.trailingAnchor, constant: 13),


                timeDelayLabel.topAnchor.constraint(equalTo: topicNameLabel.bottomAnchor, constant: 1),
                timeDelayLabel.leadingAnchor.constraint(equalTo: topicPhoto.trailingAnchor, constant: 13),
                timeDelayLabel.heightAnchor.constraint(equalToConstant: 10),
                timeDelayLabel.widthAnchor.constraint(equalToConstant: 120),
                
//                topicStackView.heightAnchor.constraint(equalToConstant: 32),
//                topicStackView.leadingAnchor.constraint(equalTo: topicPhoto.trailingAnchor, constant: 13),
//                topicStackView.trailingAnchor.constraint(equalTo: ellipseImg.leadingAnchor, constant: -13),
                
                
                ellipseImg.heightAnchor.constraint(equalToConstant: 20),
                ellipseImg.widthAnchor.constraint(equalToConstant: 20),
                ellipseImg.centerYAnchor.constraint(equalTo: blankView.centerYAnchor),
                ellipseImg.trailingAnchor.constraint(equalTo: blankView.trailingAnchor, constant: -19),
                
            ])
            
        }
    }

  
    


        

