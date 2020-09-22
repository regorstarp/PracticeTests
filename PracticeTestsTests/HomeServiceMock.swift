//
//  HomeServiceMock.swift
//  PracticeTests
//
//  Created by Roger Prats Llivina on 22/09/2020.
//  Copyright © 2020 roger. All rights reserved.
//

import Foundation
import XCTest
@testable import PracticeTests

class HomeServiceMock: HomeServiceProtocol {
    var didCallGetHomeTitle: Bool = false
    var result: Result<String, Error> = .success("Home title")
    var getHomeTitleExpectation: XCTestExpectation?
    
    func getHomeTitle(_ completion: @escaping (Result<String, Error>) -> ()) {
        didCallGetHomeTitle = true
        getHomeTitleExpectation?.fulfill()
        completion(result)
    }
}
