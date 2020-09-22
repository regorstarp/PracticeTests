//
//  HomeServiceMock.swift
//  PracticeTests
//
//  Created by Roger Prats Llivina on 22/09/2020.
//  Copyright © 2020 roger. All rights reserved.
//

import Foundation
@testable import PracticeTests

class HomeServiceMock: HomeServiceProtocol {
    var didCallGetHomeTitle: Bool = false
    var result: Result<String, Error> = .success("Home title")
    
    func getHomeTitle(_ completion: @escaping (Result<String, Error>) -> ()) {
        didCallGetHomeTitle = true
        completion(result)
    }
}
