//
//  HomeService.swift
//  PracticeTests
//
//  Created by Roger Prats Llivina on 22/09/2020.
//  Copyright © 2020 roger. All rights reserved.
//

import Foundation

protocol HomeServiceProtocol {
    func getHomeTitle(_ completion: @escaping (Result<String, Error>) -> ())
}

class HomeService: HomeServiceProtocol {
    func getHomeTitle(_ completion: @escaping (Result<String, Error>) -> ()) {
        completion(.success("Home screen"))
    }
}
