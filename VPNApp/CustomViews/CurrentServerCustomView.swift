//
//  CustomView.swift
//  VPNApp
//
//  Created by Jafar on 31.05.2022.
//

import UIKit

class CurrentServerCustomView: UIView {
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let viewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Medium", size: 13)
        label.attributedText = NSMutableAttributedString(string: "Выберите сервер", attributes: [NSAttributedString.Key.kern: 0.08])
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Medium", size: 10)
        label.adjustsFontSizeToFitWidth = true

        label.attributedText = NSMutableAttributedString(string: "Самое быстрое местоположение", attributes: [NSAttributedString.Key.kern: 0.08])
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewTimeDelayLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 10))
        label.font = UIFont(name: "Montserrat-Medium", size: 8)
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 0.4
        label.textColor = .white
        label.attributedText = NSMutableAttributedString(string: "Временная задержка: 8ms", attributes: [NSAttributedString.Key.kern: 0.08])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(systemName: "circle")
        imageView.tintColor = .white
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
    layer.cornerRadius = 8
    addSubview(imageView)
    addSubview(viewLabel)
    addSubview(viewLocationLabel)
    addSubview(viewTimeDelayLabel)
    addSubview(rightImageView)
      
    
      NSLayoutConstraint.activate([
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
        imageView.heightAnchor.constraint(equalToConstant: 39),
        imageView.widthAnchor.constraint(equalToConstant: 39),
        
        viewLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 13),
//        viewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -13),
        viewLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        
        viewLocationLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 13),
//        viewLocationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -13),
        viewLocationLabel.topAnchor.constraint(equalTo: viewLabel.bottomAnchor, constant: 5),
        viewLocationLabel.heightAnchor.constraint(equalToConstant: 12),
//        viewLocationLabel.widthAnchor.constraint(equalToConstant: 178),
        
        viewTimeDelayLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 13),
        viewTimeDelayLabel.topAnchor.constraint(equalTo: viewLocationLabel.bottomAnchor, constant: 3),
        viewTimeDelayLabel.heightAnchor.constraint(equalToConstant: 10),
        viewTimeDelayLabel.widthAnchor.constraint(equalToConstant: 120),
        
        rightImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        rightImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
        rightImageView.heightAnchor.constraint(equalToConstant: 20),
        rightImageView.widthAnchor.constraint(equalToConstant: 20),
        
      ])

      
  }
}
