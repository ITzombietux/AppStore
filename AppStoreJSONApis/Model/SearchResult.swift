//
//  SearchResult.swift
//  AppStoreJSONApis
//
//  Created by zombietux on 2019/12/30.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results : [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
}
