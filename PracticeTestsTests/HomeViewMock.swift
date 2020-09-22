//
//  HomeViewMock.swift
//  PracticeTests
//
//  Created by Roger Prats Llivina on 22/09/2020.
//  Copyright © 2020 roger. All rights reserved.
//

import Foundation
import XCTest
@testable import PracticeTests

class HomeViewMock: HomeViewProtocol {
    var updateTitleExpectation: XCTestExpectation?
    var showErrorExpectation: XCTestExpectation?
    
    var error: Error?
    var title: String?
    
    func updateTitle(_ title: String) {
        updateTitleExpectation?.fulfill()
        self.title = title
    }
    
    func showError(_ error: Error) {
        showErrorExpectation?.fulfill()
        self.error = error
    }
    
    
}
