//
//  AppsSearchController.swift
//  AppStoreJSONApis
//
//  Created by zombietux on 2019/12/26.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    fileprivate let cellId = "id1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchITunesApps()
    }
    
    fileprivate var appResults = [Result]()
    
    fileprivate func fetchITunesApps() {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        // fetch data from internet
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            
            // success
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                self.appResults = searchResult.results
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            } catch let jsonErr {
                print("Failed to decode json :", jsonErr)
            }
            
        }.resume() // fires off the rquest
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 360)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.nameLabel.text = "앱 이름"
        
        let appResult = appResults[indexPath.item]
        cell.nameLabel.text = appResult.trackName
        cell.categoryLabel.text = appResult.primaryGenreName
        cell.ratingLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
    
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
