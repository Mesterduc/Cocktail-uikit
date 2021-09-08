//
//  scrollViewItem.swift
//  Uikit Programmatic
//
//  Created by Duc hong cai on 28/08/2021.
//

import UIKit

class ScrollViewItem: UIView {

    @available(*, unavailable)
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }

    init( data:  Drink.Cocktail ) {
        super.init(frame: .zero)
        self.initialize()
        
        self.addSubview(imageItem)
        imageItem.load(url: URL(string: data.strDrinkThumb)!)
        
        self.addSubview(cocktailNameLabel)
        cocktailNameLabel.text = data.strDrink
        
        self.addSubview(cocktailCategoryLabel)
        cocktailCategoryLabel.text = data.strCategory
        
        
        setupLayout()
    }

    func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
     let cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let cocktailCategoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageItem: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
    }()
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageItem.topAnchor.constraint(equalTo: self.topAnchor),
            imageItem.heightAnchor.constraint(equalToConstant: 150),
            imageItem.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageItem.leftAnchor.constraint(equalTo: self.leftAnchor),
            cocktailNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor ),
            cocktailNameLabel.topAnchor.constraint(equalTo: imageItem.bottomAnchor),
            cocktailNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cocktailNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cocktailCategoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor ),
            cocktailCategoryLabel.topAnchor.constraint(equalTo: cocktailNameLabel.bottomAnchor),

        ])
    }
    
}
