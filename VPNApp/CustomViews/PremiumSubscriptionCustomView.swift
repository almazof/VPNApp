//
//  PremiumSubscriptionCustomView.swift
//  VPNApp
//
//  Created by Jafar on 20.06.2022.
//

import UIKit

class PremiumSubscriptionCustomView: UIView {
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Vector")
       
        return imageView
    }()
    
    let viewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-Medium", size: 13)
        label.attributedText = NSMutableAttributedString(string: "Купить Premium", attributes: [NSAttributedString.Key.kern: 0.08])
        label.textColor = .white
   
        return label
    }()
    
    let viewLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-Medium", size: 10)
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 0.6
        label.attributedText = NSMutableAttributedString(string: "Защита / Скорость / Стабильность", attributes: [NSAttributedString.Key.kern: 0.08])
        label.textColor = .white
        
        return label
    }()

    
    let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.image = UIImage(systemName: "chevron.compact.right")
        imageView.tintColor = .white
        imageView.alpha = 0.6
        imageView.clipsToBounds = true
       
        return imageView
    }()

    
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
      
  }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
  private func setupView() {
    backgroundColor = #colorLiteral(red: 0.4310564399, green: 0.2845467925, blue: 0.9575057626, alpha: 1)
    layer.cornerRadius = 15
    addSubview(imageView)
    addSubview(viewLabel)
    addSubview(viewLocationLabel)
    addSubview(rightImageView)
      
    
      NSLayoutConstraint.activate([
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),
        imageView.heightAnchor.constraint(equalToConstant: 39),
        imageView.widthAnchor.constraint(equalToConstant: 39),
        
        viewLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 26),
        viewLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
        
        viewLocationLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 26),
        viewLocationLabel.topAnchor.constraint(equalTo: viewLabel.bottomAnchor, constant: 5),
        viewLocationLabel.heightAnchor.constraint(equalToConstant: 12),

        rightImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        rightImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
        rightImageView.heightAnchor.constraint(equalToConstant: 20),
        rightImageView.widthAnchor.constraint(equalToConstant: 20),
        
        
      ])

      
  }
    

}
