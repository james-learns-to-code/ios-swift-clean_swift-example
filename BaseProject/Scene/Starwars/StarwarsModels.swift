//
//  StarwarsModels.swift
//  BaseProject
//
//  Created by dongseok lee on 25/09/2019.
//  Copyright (c) 2019 Good Effect. All rights reserved.
//

import UIKit

enum Starwars {
    static let path = StarwarsNetworkManager.URL.base
    
    enum Film {
        enum Request {
            case list
            
            static let filmsPath = "films/"

            var url: String {
                switch self {
                case .list: return Starwars.path + Request.filmsPath
                }
            }
            var type: NetworkManager.RequestType {
                switch self {
                case .list: return .get
                }
            }
        }
        
        typealias Response = StarwarsFilmsModel
        
        struct ViewModel {
            let title: String?
            
            init(film: StarwarsFilmModel?) {
                title = ViewModel.getTitle(from: film)
            }
            
            static func getTitle(from film: StarwarsFilmModel?) -> String {
                return "\(film?.episode_id ?? 0) \(film?.title ?? "") - \(film?.director ?? "")"
            }
        }
    }
}

// MARK: Response

struct StarwarsFilmsModel: Codable {
    let results: [StarwarsFilmModel]?
}

struct StarwarsFilmModel: Codable {
    let title: String?
    let episode_id: Int?
    let director: String?
}
