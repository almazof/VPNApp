//
//  SubscribeCell.swift
//  VPNApp
//
//  Created by Jafar on 22.06.2022.
//

import UIKit

class SubscribeCell: UITableViewCell {

    
    let blankView = UIView()
    
     lazy var monthLabel = UILabel()
     lazy var discountLabel = UILabel()
     lazy var priceLabel = UILabel()
     lazy var ellipseImg = UIImageView()
  
    static let reuseID = "SubscribeCell"

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
        
        self.backgroundColor = .clear
        contentView.backgroundColor = appColor
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    extension SubscribeCell {
        private func setup() {
            blankView.translatesAutoresizingMaskIntoConstraints = false
            blankView.backgroundColor = appColor
            blankView.layer.cornerRadius = 15
            blankView.layer.borderWidth = 2
       
            
            monthLabel.translatesAutoresizingMaskIntoConstraints = false
            monthLabel.font = UIFont(name: "Montserrat-SemiBold", size: 13)
            monthLabel.attributedText = NSMutableAttributedString(string: "3 месяца", attributes: [NSAttributedString.Key.kern: 0.13])
            



            discountLabel.translatesAutoresizingMaskIntoConstraints = false
            discountLabel.font = UIFont(name: "Montserrat-Medium", size: 10)
            discountLabel.adjustsFontSizeToFitWidth = true
            discountLabel.alpha = 0.4
            discountLabel.attributedText = NSMutableAttributedString(string: "Временная задержка: 8ms", attributes: [NSAttributedString.Key.kern: 0.1])
            
            priceLabel.translatesAutoresizingMaskIntoConstraints = false
            priceLabel.font = UIFont(name: "Montserrat-SemiBold", size: 20)
            priceLabel.attributedText = NSMutableAttributedString(string: "3 месяца", attributes: [NSAttributedString.Key.kern: 0.08])
            
            
            ellipseImg.translatesAutoresizingMaskIntoConstraints = false
            ellipseImg.image = UIImage(systemName: "circle")
            ellipseImg.layer.cornerRadius = 5
            ellipseImg.clipsToBounds = false
            ellipseImg.tintColor = .black
          
            
     
            blankView.addSubview(monthLabel)
            blankView.addSubview(discountLabel)
            blankView.addSubview(priceLabel)
            blankView.addSubview(ellipseImg)
            
            
            contentView.addSubview(blankView)
           
        }
        private func layout() {
            NSLayoutConstraint.activate([
                blankView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
                blankView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
                trailingAnchor.constraint(equalToSystemSpacingAfter: blankView.trailingAnchor, multiplier: 2),
                bottomAnchor.constraint(equalToSystemSpacingBelow: blankView.bottomAnchor, multiplier: 1),
                
                monthLabel.topAnchor.constraint(equalTo: blankView.topAnchor, constant: 16),
                monthLabel.leadingAnchor.constraint(equalTo: blankView.leadingAnchor, constant: 26),


                discountLabel.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 5),
                discountLabel.leadingAnchor.constraint(equalTo: blankView.leadingAnchor, constant: 26),
                discountLabel.heightAnchor.constraint(equalToConstant: 10),
                discountLabel.widthAnchor.constraint(equalToConstant: 120),
                
                priceLabel.topAnchor.constraint(equalTo: blankView.topAnchor, constant: 21),
                priceLabel.trailingAnchor.constraint(equalTo: ellipseImg.leadingAnchor, constant: -12),
                priceLabel.centerYAnchor.constraint(equalTo: blankView.centerYAnchor),
                
                ellipseImg.heightAnchor.constraint(equalToConstant: 20),
                ellipseImg.widthAnchor.constraint(equalToConstant: 20),
                ellipseImg.centerYAnchor.constraint(equalTo: blankView.centerYAnchor),
                ellipseImg.trailingAnchor.constraint(equalTo: blankView.trailingAnchor, constant: -19),
                
            ])
            
        }
    }

  
    
