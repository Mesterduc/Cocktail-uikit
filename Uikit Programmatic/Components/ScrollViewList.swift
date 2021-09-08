//
//  ScrollViewList.swift
//  Uikit Programmatic
//
//  Created by Duc hong cai on 05/09/2021.
//

import UIKit

class ScrollViewList: UIScrollView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    var scrollView: UIScrollView?
    var viewController: UIViewController!
    
    init(data: [Drink.Cocktail], viewController: UIViewController) {
        super.init(frame: .zero)
        
        self.initialize()
        self.viewController = viewController
        addScrollViewItem(data: data)
      
    }
    @objc private func buttonAction(sender: CustomTapGesture){
        let vc = CocktailView()
        vc.data = sender.data
//        vc.view.backgroundColor = .blue
//        print("hello")
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
//        self.viewController.present(nav, animated: true)
        
        self.viewController.navigationController?.pushViewController(vc, animated: true)
//        self.viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func addScrollViewItem(data: [Drink.Cocktail] ) {
        // save where the last item is, so we can put the next constraint item on it
        var upperView: UIView = self
        for (index, cocktail) in data.enumerated(){
            // creates items in the scrollview
            let contentView = ScrollViewItem(data: cocktail)
            
            //---------------- button -----------------
            
            let tap = CustomTapGesture(target: self, action: #selector(self.buttonAction(sender:)))
            tap.data = cocktail
            contentView.addGestureRecognizer(tap)
            
            //-------------------------------------------
            
            self.addSubview(contentView)
            contentView.translatesAutoresizingMaskIntoConstraints = false
            
            if(index == 0){
                NSLayoutConstraint.activate([
                    contentView.heightAnchor.constraint(equalToConstant: 200),
                    contentView.widthAnchor.constraint(equalToConstant: 200),
                    contentView.leadingAnchor.constraint(equalTo: upperView.leadingAnchor),
                ])
            }
            else if (index + 1 == data.count){
                NSLayoutConstraint.activate([
                    contentView.heightAnchor.constraint(equalToConstant: 200),
                    contentView.widthAnchor.constraint(equalToConstant: 200),
                    contentView.leadingAnchor.constraint(equalTo: upperView.trailingAnchor, constant: 10),
                    contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                ])
            }else {
                NSLayoutConstraint.activate([
                    contentView.heightAnchor.constraint(equalToConstant: 200),
                    contentView.widthAnchor.constraint(equalToConstant: 200),
                    contentView.leadingAnchor.constraint(equalTo: upperView.trailingAnchor, constant: 10),
                ])
            }
            // saves the new item
            upperView = contentView
        }
    }
    
}
