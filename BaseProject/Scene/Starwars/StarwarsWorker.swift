//
//  StarwarsWorker.swift
//  BaseProject
//
//  Created by dongseok lee on 25/09/2019.
//  Copyright (c) 2019 Good Effect. All rights reserved.
//

import Foundation

struct StarwarsWorker {
    func requestFilmList(
        handler: @escaping (Result<Starwars.Film.Response, NetworkError>) -> Void) {
        let request = Starwars.Film.Request.list
        API.shared.request(
            with: request.url,
            type: request.type
        ) { result in
            NetworkManager.Decoder<Starwars.Film.Response>
                .decodeResult(result, handler: handler)
        }
    }
}
