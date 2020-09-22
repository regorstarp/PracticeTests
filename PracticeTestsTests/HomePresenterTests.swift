//
//  HomePresenterTests.swift
//  HomePresenterTests
//
//  Created by Roger Prats Llivina on 22/09/2020.
//  Copyright © 2020 roger. All rights reserved.
//

import XCTest
@testable import PracticeTests

class HomePresenterTests: XCTestCase {

    var presenter: HomePresenter!
    
    override func setUpWithError() throws {
        presenter = HomePresenter()
    }

    func testPresenterCallsViewUpdateTitleOnSuccess() throws {
        let view = HomeViewMock()
        view.didCallShowError = false
        view.didCallUpdateTitle = false
        presenter.view = view
        
        let service = HomeServiceMock()
        service.didCallGetHomeTitle = false
        service.result = .success("Hello World")
        presenter.service = service
        
        presenter.fetchHomeTitle()
        
        XCTAssertTrue(service.didCallGetHomeTitle, "Presenter called service's didCallGetHomeTitle")
        XCTAssertTrue(view.didCallUpdateTitle, "Presenter called view's didCallUpdateTitle")
        XCTAssertEqual(view.title, "Hello World", "The view's title is correct")
    }
    
    func testPresenterCallsViewShowErrorOnFailure() throws {
        let view = HomeViewMock()
        view.didCallShowError = false
        view.didCallUpdateTitle = false
        presenter.view = view
        
        let service = HomeServiceMock()
        service.didCallGetHomeTitle = false
        let error = ErrorMock.serverError
        service.result = .failure(error)
        presenter.service = service
        
        presenter.fetchHomeTitle()
        
        XCTAssertTrue(service.didCallGetHomeTitle, "Presenter called service's didCallGetHomeTitle")
        XCTAssertTrue(view.didCallShowError, "Presenter called view's didCallShowError")
        if case .serverError = view.error as? ErrorMock {
            
        } else {
            XCTFail("The view recieves the wrong error")
        }
    }
}
