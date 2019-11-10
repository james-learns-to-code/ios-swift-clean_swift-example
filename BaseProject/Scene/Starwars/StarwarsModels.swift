//
//  StarwarsModels.swift
//  BaseProject
//
//  Created by dongseok lee on 25/09/2019.
//  Copyright (c) 2019 Good Effect. All rights reserved.
//

import Foundation

enum Starwars {
    static let path = "https://swapi.co/api/"
    
    enum Film {
        static let path = "films/"

        enum Request {
            case list

            var url: String {
                switch self {
                case .list: return Starwars.path + Film.path
                }
            }
            var type: NetworkManager.RequestType {
                switch self {
                case .list: return .get
                }
            }
        }
        
        typealias Response = StarwarsFilmsModel
        typealias ViewModel = StarwarsViewModel
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

// MARK: ViewModel
struct StarwarsViewModel {
    let title: String?
    
    init(film: StarwarsFilmModel?) {
        title = StarwarsViewModel.getTitle(from: film)
    }
    
    private static func getTitle(from film: StarwarsFilmModel?) -> String {
        "\(film?.episode_id ?? 0) \(film?.title ?? "") - \(film?.director ?? "")"
    }
}
