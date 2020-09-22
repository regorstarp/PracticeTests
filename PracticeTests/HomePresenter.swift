//
//  HomePresenter.swift
//  PracticeTests
//
//  Created by Roger Prats Llivina on 22/09/2020.
//  Copyright © 2020 roger. All rights reserved.
//

import Foundation

protocol HomePresenterProtocol {
    func fetchHomeTitle()
}

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    var service: HomeServiceProtocol?
    
    func fetchHomeTitle() {
        service?.getHomeTitle { [weak self] result in
            switch result {
            case .success(let title):
                self?.view?.updateTitle(title)
            case .failure(let error):
                self?.view?.showError(error)
            }
        }
    }
}
