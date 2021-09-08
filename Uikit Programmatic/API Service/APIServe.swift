//
//  APIServe.swift
//  Uikit Programmatic
//
//  Created by Duc hong cai on 28/08/2021.
//

import Foundation
import Combine

class APIService :  NSObject {
    
    private let sourceURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
    
//    func apiToGetEmployeeData(completion : @escaping ([Drink.Cocktail]) -> ()){
        func apiToGetEmployeeData(completion:@escaping (([Drink.Cocktail]) -> Void)) {
        if let url = URL(string: sourceURL) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    let drink = try? JSONDecoder().decode(Drink.self , from: data )
                    completion(drink?.drinks ?? [])
                }
            }.resume()
        }
    }
    
    func fetchImage(urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
        let session = URLSession.shared
        let url = URL(string: urlString)
            
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error fetching the image! 😢")
                completionHandler(nil)
            } else {
                completionHandler(data)
                print(data!)
            }
        }
        dataTask.resume()
    }
    
}

//var cancellables: Set<AnyCancellable> = []
//
//private func bindViewModel() {
//        let view = UIView()
//        myScrollView.publisher(for: myScrollView)
//        viewModel.$empData
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] value in
//                self?.hej(drink: value)
//            }.store(in: &cancellables)
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    print("finished")
//                case .failure(let err):
//                    print(err)
//                }
//            }, receiveValue: { [weak self] value in
////                print(value)
//                print("asd")
//                self?.hej(drink: value)
////                self?.viewModel.empData  = value
//            }).store(in: &cancellables)
//        }
