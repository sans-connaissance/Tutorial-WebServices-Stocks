//
//  Webservice.swift
//  Tutorial-WebServices-Stocks
//
//  Created by David Malicke on 6/12/22.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data = data, error == nil else {
                return
                
            }
            DispatchQueue.main.async {
                self.downloadedData = data
            }
            
        }.resume()
    }
    
}

class Webservice {
    
    func getTopNews(completion: @escaping (([Article]?) -> Void)) {
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(articles)
            }
            
        }.resume()
        
    }
    
    
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            
            DispatchQueue.main.async {
                completion(stocks)
            }
            
        }.resume()
        
    }
    
}
    

