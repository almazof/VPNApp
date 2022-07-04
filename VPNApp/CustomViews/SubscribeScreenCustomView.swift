//
//  SubscribeScreenCustomView.swift
//  VPNApp
//
//  Created by Jafar on 20.06.2022.
//

import UIKit

class SubscribeScreenCustomView: UIView {
    
    
    let blankView: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 12
       
        return imageView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Vector")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        label.attributedText = NSMutableAttributedString(string: "Купить Premium", attributes: [NSAttributedString.Key.kern: 0.08])
        
   
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-Regular", size: 9)
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 0.6
        label.attributedText = NSMutableAttributedString(string: "Защита / Скорость / Стабильность", attributes: [NSAttributedString.Key.kern: 0.08])
        
        return label
    }()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
      
  }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
  private func setupView() {
      backgroundColor = .appColor
      
      addSubview(blankView)
      addSubview(imageView)
      addSubview(titleLabel)
      addSubview(subtitleLabel)
      
    
      NSLayoutConstraint.activate([
        blankView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
        blankView.heightAnchor.constraint(equalToConstant: 48),
        blankView.widthAnchor.constraint(equalToConstant: 47),
        
        imageView.centerXAnchor.constraint(equalTo: blankView.centerXAnchor),
        imageView.centerYAnchor.constraint(equalTo: blankView.centerYAnchor),
    
        
        titleLabel.leadingAnchor.constraint(equalTo: blankView.trailingAnchor, constant: 7),
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
        
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
        subtitleLabel.heightAnchor.constraint(equalToConstant: 11),
        subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),

        ])

      
  }
    

}
