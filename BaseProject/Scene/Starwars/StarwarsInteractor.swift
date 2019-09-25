//
//  StarwarsInteractor.swift
//  BaseProject
//
//  Created by dongseok lee on 25/09/2019.
//  Copyright (c) 2019 Good Effect. All rights reserved.
//

import UIKit

protocol StarwarsBusinessLogic {
    func displayFilmList()
}

protocol StarwarsDataStore {
    // Core Data, etc
}

final class StarwarsInteractor: StarwarsDataStore {
    private let presenter: StarwarsPresentationLogic

    init(presenter: StarwarsPresenter) {
        self.presenter = presenter
    }
}

extension StarwarsInteractor: StarwarsBusinessLogic {
    func displayFilmList() {
        let worker = StarwarsWorker()
        worker.requestFilmList { [weak self] result in
                switch result {
                case .success(let value):
                    self?.presenter.displayFilmList(response: value)
                case .failure(let error):
                    self?.presenter.presentError(error: error)
            }
        }
    }
}
