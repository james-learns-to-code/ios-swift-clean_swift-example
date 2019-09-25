//
//  NetworkResponseTests.swift
//  BaseProjectTests
//
//  Created by dongseok lee on 26/09/2019.
//  Copyright © 2019 Good Effect. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import BaseProject

class NetworkResponseTests: QuickSpec {

    override func spec() {
        
        // Setup
        let worker = StarwarsWorker()
        let timeout = TimeInterval(5)

        // Network response have to be called-back in time
        describe("Network request") {
            context("Starwars api list") {
                it("Have to be called-back in time") {
                    waitUntil(timeout: timeout) { done in
                        worker.requestFilmList { result in
                            guard case .success = result else { fail(); return }
                            done()
                        }
                    }
                }
            }
        }
    }
}
