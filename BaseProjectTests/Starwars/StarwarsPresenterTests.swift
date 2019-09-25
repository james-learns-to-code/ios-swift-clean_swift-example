//
//  StarwarsPresenterTests.swift
//  BaseProject
//
//  Created by dongseok lee on 25/09/2019.
//  Copyright (c) 2019 Good Effect. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import BaseProject

class StarwarsPresenterTests: QuickSpec {
    
    override func spec() {
        
        // Setup
        let presenter = StarwarsPresenter()
        let spy = StarwarsDisplayLogicSpy()
        presenter.setViewController(spy)

        // Presenter should call view controller if response received
        describe("Presenter") {
            context("Starwars") {
                it("Should call view controller if response received") {
                    presenter.displayFilmList(response: Starwars.Film.Response(results: []))
                    expect(spy.displayFilmListCalled).to(equal(true))
                    presenter.presentError(error: NetworkError.url)
                    expect(spy.presentErrorCalled).to(equal(true))
                }
            }
        }
    }
}

class StarwarsDisplayLogicSpy: StarwarsDisplayLogic {
    
    private(set) var displayFilmListCalled = false
    func displayFilmList(viewModels: [Starwars.Film.ViewModel]) {
        displayFilmListCalled = true
    }
    
    private(set) var presentErrorCalled = false
    func presentError(message: String) {
        presentErrorCalled = true
    }
}
