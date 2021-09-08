//
//  ViewViewModelController.swift
//  Uikit Programmatic
//
//  Created by Duc hong cai on 28/08/2021.
//

import Foundation
import Combine

class ViewViewModelController: ObservableObject {
    private var apiService : APIService!
    @Published private(set) var drinkData: [Drink.Cocktail] = []
    
    init() {
        self.apiService =  APIService()
        getCocktail()
    }
    
    func getCocktail() {
        self.apiService.apiToGetEmployeeData { (drinks) in
            self.drinkData = drinks
        }
    }
    
//    func getImage(url: String) {
//        apiService.fetchImage(urlString: url) { data in
//            return data
//        }
//    }
    
}
