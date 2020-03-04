//
//  Service.swift
//  AppStoreJSONApis
//
//  Created by zombietux on 2019/12/31.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation

class Service {
    //TODO:- 싱글톤 수정 해야함.
    static let shared = Service() // singleton
    
    func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        // fetch data from internet
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Failed to fetch apps:", err)
                completion([], nil)
                return
            }
            
            // success
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                completion(searchResult.results, nil)
                
            } catch let jsonErr {
                print("Failed to decode json :", jsonErr)
                completion([], jsonErr)
            }
            
        }.resume() // fires off the rquest
    }
}
