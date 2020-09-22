//
//  HomeViewMock.swift
//  PracticeTests
//
//  Created by Roger Prats Llivina on 22/09/2020.
//  Copyright © 2020 roger. All rights reserved.
//

import Foundation
@testable import PracticeTests

class HomeViewMock: HomeViewProtocol {
    var didCallUpdateTitle: Bool = false
    var didCallShowError: Bool = false
    
    var error: Error?
    var title: String?
    
    func updateTitle(_ title: String) {
        self.didCallUpdateTitle = true
        self.title = title
    }
    
    func showError(_ error: Error) {
        self.didCallShowError = true
        self.error = error
    }
    
    
}
