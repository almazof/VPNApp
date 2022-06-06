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
    lazy var topicStackView = UIStackView()
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
            
            topicStackView.translatesAutoresizingMaskIntoConstraints = false
            topicStackView.axis = .vertical
            topicStackView.spacing = 1
            
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
          
            
            contentView.addSubview(blankView)
            blankView.addSubview(topicPhoto)
            topicStackView.addSubview(topicNameLabel)
            topicStackView.addSubview(timeDelayLabel)
//            blankView.addSubview(topicNameLabel)
//            blankView.addSubview(timeDelayLabel)
            blankView.addSubview(topicStackView)
            blankView.addSubview(ellipseImg)
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
                
//                topicNameLabel.leadingAnchor.constraint(equalTo: topicPhoto.trailingAnchor, constant: 13),
//                topicNameLabel.topAnchor.constraint(equalTo: blankView.topAnchor, constant: 9),
//
//                timeDelayLabel.leadingAnchor.constraint(equalTo: topicPhoto.trailingAnchor, constant: 13),
//                timeDelayLabel.topAnchor.constraint(equalTo: topicNameLabel.bottomAnchor, constant: 1),
////                timeDelayLabel.heightAnchor.constraint(equalToConstant: 10),
//                timeDelayLabel.widthAnchor.constraint(equalToConstant: 120),
                
                topicStackView.heightAnchor.constraint(equalToConstant: 32),
                topicStackView.leadingAnchor.constraint(equalTo: topicPhoto.trailingAnchor, constant: 13),
                topicStackView.trailingAnchor.constraint(equalTo: ellipseImg.leadingAnchor, constant: -13),
                
                
                ellipseImg.heightAnchor.constraint(equalToConstant: 20),
                ellipseImg.widthAnchor.constraint(equalToConstant: 20),
                ellipseImg.centerYAnchor.constraint(equalTo: blankView.centerYAnchor),
                ellipseImg.trailingAnchor.constraint(equalTo: blankView.trailingAnchor, constant: -19),
                
            ])
            
        }
    }
//
//        self.clipsToBounds = true
////        self.layer.borderWidth = 0.1
////        self.accessoryType = .none
//        self.backgroundColor = .clear
//        self.textLabel?.numberOfLines = .zero
//        self.textLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 40)
//        self.contentView.backgroundColor = .clear
//        self.contentView.addSubview(newView)
//        newView.translatesAutoresizingMaskIntoConstraints = false
//        newView.layer.cornerRadius = 15
//        newView.backgroundColor = .yellow
//        newView.addSubview(topicPhoto)
//        newView.addSubview(topicNameLabel)
//        newView.addSubview(timeDelayLabel)
//        newView.addSubview(ellipseImg)
//
//        configureImage()
//        configureLabel()
//
//    }
//
//
//
//
//    private lazy var newView = UIView(frame: CGRect(x: 210, y: 10, width: 110, height: 50))
//
//    private lazy var backView: UIView = {
//        var view = UIView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
//        view.backgroundColor = .red
//        view.layer.cornerRadius = 12
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//
//    private lazy var topicPhoto: UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = .white
//        imageView.layer.cornerRadius = 15
//        imageView.clipsToBounds = false
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    private lazy var topicNameLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: "Montserrat-Medium", size: 15)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//
//    private lazy var timeDelayLabel: UILabel = {
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 10))
//        label.font = UIFont(name: "Montserrat-Medium", size: 8)
//        label.adjustsFontSizeToFitWidth = true
//        label.alpha = 0.4
//        label.attributedText = NSMutableAttributedString(string: "Временная задержка: 8ms", attributes: [NSAttributedString.Key.kern: 0.08])
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//
//    private lazy var ellipseImg: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "circle")
//        imageView.layer.cornerRadius = 5
//        imageView.clipsToBounds = false
//        imageView.tintColor = .black
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//
//
//
//
//
//
//    func configureImage() {
//
//
//        NSLayoutConstraint.activate([
//            topicPhoto.centerYAnchor.constraint(equalTo: newView.centerYAnchor),
//            topicPhoto.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: 15),
//            topicPhoto.heightAnchor.constraint(equalToConstant: 39),
//            topicPhoto.widthAnchor.constraint(equalToConstant: 39),
////
//
//
//        ])
//    }
//
//    private func configureLabel() {
//
//        NSLayoutConstraint.activate([
////            topicNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            topicNameLabel.leadingAnchor.constraint(equalTo: topicPhoto.trailingAnchor, constant: 13),
//            topicNameLabel.topAnchor.constraint(equalTo: newView.topAnchor, constant: 9),
//
//            timeDelayLabel.leadingAnchor.constraint(equalTo: topicPhoto.trailingAnchor, constant: 13),
//            timeDelayLabel.topAnchor.constraint(equalTo: topicNameLabel.bottomAnchor, constant: 3),
//            timeDelayLabel.heightAnchor.constraint(equalToConstant: 10),
//            timeDelayLabel.widthAnchor.constraint(equalToConstant: 120),
//
//            ellipseImg.heightAnchor.constraint(equalToConstant: 20),
//            ellipseImg.widthAnchor.constraint(equalToConstant: 20),
//            ellipseImg.centerYAnchor.constraint(equalTo: newView.centerYAnchor),
//            ellipseImg.trailingAnchor.constraint(equalTo: newView.trailingAnchor, constant: -19),
//
//            newView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
//            newView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
////            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: newView.trailingAnchor, multiplier: 1)
//        ])
//
//
//    }
//
    
    


        

