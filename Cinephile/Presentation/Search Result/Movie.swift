//
//  Movie.swift
//  Cinephile
//
//  Created by Muhammad Fahied on 5/4/19.
//  Copyright © 2019 Spider. All rights reserved.
//

import Foundation

final class Movie: Encodable {
    
    var id: UInt?
    var title: String?
    var popularity: Double?
    var posterPath: String?
    var releaseDate: String?
    var overview: String?
    var runtime: UInt?
    var revenue: UInt?
    var originalLanguage: String?
    var homepage: String?
}

extension Movie: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        
        case id
        case title
        case popularity
        case overview
        case revenue
        case runtime
        case homepage
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? values.decode(UInt.self, forKey: .id)
        title = try? values.decode(String.self, forKey: .title)
        popularity = try? values.decode(Double.self, forKey: .popularity)
        posterPath = try? values.decode(String.self, forKey: .posterPath)
        releaseDate = try? values.decode(String.self, forKey: .releaseDate)
        overview = try? values.decode(String.self, forKey: .overview)
        runtime = try? values.decode(UInt.self, forKey: .runtime)
        revenue = try? values.decode(UInt.self, forKey: .revenue)
        originalLanguage = try? values.decode(String.self, forKey: .originalLanguage)
        homepage = try? values.decode(String.self, forKey: .homepage)
    }
}

extension Movie {
    
    static func load(from jsonString: String) -> [Movie]{
        let data =  jsonString.data(using: .utf8)!
        let jsonDecoder = JSONDecoder()
        let movies = try! jsonDecoder.decode([Movie].self, from: data)
        return movies
    }
}
