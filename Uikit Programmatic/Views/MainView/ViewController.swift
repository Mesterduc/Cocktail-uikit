//
//  ViewController.swift
//  Uikit Programmatic
//
//  Created by Duc hong cai on 24/08/2021.
//

import UIKit
import Combine


class ViewController: UIViewController {
    
    
    private var viewModel : ViewViewModelController!
    var cancellable: Set<AnyCancellable> = []
    var margaritaScrollView: ScrollViewList!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.viewModel = ViewViewModelController()
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(heroBannerView)
        
        margaritaScrollView = ScrollViewList(data: viewModel.drinkData, viewController: self)
        scrollView.addSubview(margaritaScrollView)
        scrollViewListBinding()
        
        
        setupLayout()
        
    }
    
    
    // updates the scrollView
    func scrollViewListBinding() {
        self.viewModel.$drinkData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.margaritaScrollView.addScrollViewItem(data: value)
            }.store(in: &cancellable)
    }
    
    // banner
    lazy var heroBannerView: UIImageView = {
        let img = UIImageView(image: #imageLiteral(resourceName: "cocktail2"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
        
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        //        scrollView.backgroundColor = .blue
        return scrollView
    }()
    
    private func setupLayout() {
        //        var upperView: UIView =
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            //            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            heroBannerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            heroBannerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3 ),
            //            heroBannerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            heroBannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            heroBannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            margaritaScrollView.topAnchor.constraint(equalTo: heroBannerView.bottomAnchor, constant: 25),
            margaritaScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            margaritaScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            margaritaScrollView.heightAnchor.constraint(equalToConstant: 200),
            margaritaScrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
        ])
    }
    
}

class CustomTapGesture: UITapGestureRecognizer {
    var data: Drink.Cocktail?
}

//protocol passData {
//    func onPizzaReady(data: Drink.Cocktail)
//}
