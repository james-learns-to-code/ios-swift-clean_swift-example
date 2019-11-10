//
//  StarwarsPresenter.swift
//  BaseProject
//
//  Created by dongseok lee on 25/09/2019.
//  Copyright (c) 2019 Good Effect. All rights reserved.
//

import Foundation

final class StarwarsPresenter {
    private weak var viewController: StarwarsDisplayLogic?

    func setViewController(_ viewController: StarwarsDisplayLogic) {
        self.viewController = viewController
    }
}

protocol StarwarsPresentationLogic {
    func displayFilmList(response: Starwars.Film.Response)
    func presentError(error: NetworkError)
}

extension StarwarsPresenter: StarwarsPresentationLogic {

    func displayFilmList(response: Starwars.Film.Response) {
        let viewModels = response.results?.compactMap {
            Starwars.Film.ViewModel(film: $0)
        } ?? []
        viewController?.displayFilmList(viewModels: viewModels)
    }
        
    func presentError(error: NetworkError) {
        let message = error.localizedDescription
        viewController?.presentError(message: message)
    }
}
