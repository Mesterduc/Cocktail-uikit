//
//  CocktailView.swift
//  Uikit Programmatic
//
//  Created by Duc hong cai on 05/09/2021.
//

import UIKit

class CocktailView: UIViewController {
    var data: Drink.Cocktail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: true)
//        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        
        view.addSubview(cocktailImage)
        cocktailImage.load(url: URL(string: data.strDrinkThumb)!)
        
        nameLbl.text = data.strDrink
        view.addSubview(nameLbl)
        alcoholicLbl.text = data.strAlcoholic
        view.addSubview(alcoholicLbl)
        
        view.addSubview(instructionLbl)
        
        instructionText.text = data.strInstructions
        view.addSubview(instructionText)
        setupLayout()
        
    }
    @objc func buttonAction2(){
        let vc = UIViewController()
//        print("hello")
            vc.view.backgroundColor = .blue
    //        self.present(vc, animated: true)
            //        self.navigationController?.pushViewController(vc, animated: true)
            //        vc.data = sender.data
            //        vc.testData2 = self
            //        let nav = UINavigationController(rootViewController: vc)
            //        nav.modalPresentationStyle = .fullScreen
            //        self.present(nav, animated: true)
                navigationController?.pushViewController(vc, animated: true)
    }
    let cocktailImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
    }()
    
    let nameLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //       label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let alcoholicLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let instructionLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Instruction"
        return label
    }()
    
    let instructionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
        return label
    }()
    
//    func makeBackButton() -> UIButton {
//        let backButtonImage = UIImage(named: "backbutton")?.withRenderingMode(.alwaysTemplate)
//        let backButton = UIButton(type: .custom)
//        backButton.setImage(backButtonImage, for: .normal)
//        backButton.tintColor = .blue
//        backButton.setTitle("  Back", for: .normal)
//        backButton.setTitleColor(.blue, for: .normal)
//        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
//        return backButton
//    }
    
    //return to prev controller
//    @objc func backButtonPressed() {
//        dismiss(animated: true, completion: nil)
//        navigationController?.setNavigationBarHidden(true, animated: true)
//        navigationController?.popViewController(animated: true)
//    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            cocktailImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cocktailImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            cocktailImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            cocktailImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3),
            nameLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alcoholicLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor),
            alcoholicLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            instructionLbl.topAnchor.constraint(equalTo: alcoholicLbl.bottomAnchor),
            instructionLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            instructionText.topAnchor.constraint(equalTo: instructionLbl.bottomAnchor),
            instructionText.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            instructionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
}
