//
//  StarwarsViewControllerTests.swift
//  BaseProject
//
//  Created by dongseok lee on 25/09/2019.
//  Copyright (c) 2019 Good Effect. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import BaseProject

class StarwarsViewControllerTests: QuickSpec {
    
    override func spec() {
        
        // Setup
        let window = UIWindow()
        let spy = StarwarsBusinessLogicSpy()
        let vc = StarwarsViewController(interactor: spy)
        window.addSubview(vc.view)
        RunLoop.current.run(until: Date())

        // View controller must call business logic when view did loaded
        describe("View Controller") {
            context("Starwars") {
                it("Should call business logic when view did loaded") {
                    expect(spy.displayFilmListCalled).to(equal(true))
                }
            }
        }
    }
}

class StarwarsBusinessLogicSpy: StarwarsBusinessLogic {
    
    private(set) var displayFilmListCalled = false
    func displayFilmList() {
        displayFilmListCalled = true
    }
}
