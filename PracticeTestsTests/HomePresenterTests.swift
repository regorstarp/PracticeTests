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
    var view: HomeViewMock!
    var service: HomeServiceMock!
    
    override func setUp() {
        presenter = HomePresenter()
        view = HomeViewMock()
        service = HomeServiceMock()
        presenter.view = view
        presenter.service = service
    }
    
    func testPresenterCallsServiceGetHomeTitle() throws {
        let getHomeTitleExpectation = XCTestExpectation(description: "Service requests the home title")
        service.getHomeTitleExpectation = getHomeTitleExpectation
        
        presenter.fetchHomeTitle()
        
        XCTAssertTrue(service.didCallGetHomeTitle, "Presenter called service's didCallGetHomeTitle")
        wait(for: [getHomeTitleExpectation], timeout: 0.2)
    }

    func testPresenterCallsViewUpdateTitleOnSuccess() throws {
        service.result = .success("Hello World")
        let updateTitleExpectation = XCTestExpectation(description: "Presenter calls view's updateTitle")
        view.updateTitleExpectation = updateTitleExpectation
        
        presenter.fetchHomeTitle()
        
        wait(for: [updateTitleExpectation], timeout: 0.2)
    }
    
    func testPresenterCallsViewShowErrorOnFailure() throws {
        let error = ErrorMock.serverError
        service.result = .failure(error)
        let showErrorExpectation = XCTestExpectation(description: "Presenter calls view's showError")
        view.showErrorExpectation = showErrorExpectation
        
        presenter.fetchHomeTitle()
        
        wait(for: [showErrorExpectation], timeout: 0.2)
    }
    
    func testViewRecievesCorrectTitleOnSuccess() throws {
        service.result = .success("Hello World")
        let waitForFetchHomeTitleExpectation = XCTestExpectation()
        
        presenter.fetchHomeTitle()
        
        let result = XCTWaiter.wait(for: [waitForFetchHomeTitleExpectation],
                                    timeout: 0.2)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(view.title, "Hello World")
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testViewRecievesCorrectErrorOnFailure() throws {
        let error = ErrorMock.serverError
        service.result = .failure(error)
        let waitForFetchHomeTitleExpectation = XCTestExpectation()
        
        presenter.fetchHomeTitle()
        
        let result = XCTWaiter.wait(for: [waitForFetchHomeTitleExpectation],
                                    timeout: 0.2)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNotNil(view.error)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
