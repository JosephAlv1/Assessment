//
//  MasterPresenterTests.swift
//  AssesmentTests
//
//  Created by iQueue on 22/01/2022.
//

import XCTest
@testable import Assesment

class MasterPresenterTests: XCTestCase {
    
    var sut: MasterPresenterSpy!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MasterPresenterSpy()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPresentAnimies_whenCalled_returnTrue() {
        
        //Act
        let animies: [Master.Animie] = [
            Master.Animie.init(malID: 402, url: "", imageURL: "", title: "", airing: true, synopsis: "", type: "", episodes: 100, score: 100, startDate: "", endDate: "", members: 10, rated: "")
        ]
        
        sut.presentAnimies(viewData: Master.ViewData.init(animies: animies))
        
        // Assert
        XCTAssert(sut.didPresentAnimiesCalled, "presentAnimies(viewData: Master.ViewData) should be called ")

        
    }
    
    func testPresentError_whenCalled_returnTrue() {
        
        //Act
        sut.presentError(errorString: "")
        // Assert
        XCTAssert(sut.didPresentErrorCalled, "presentError(errorString: String) should be called ")
    }

}

class MasterPresenterSpy: MasterPresentationProtocol {
    
    var didPresentAnimiesCalled: Bool = false
    var didPresentErrorCalled: Bool = false
    
    func presentAnimies(viewData: Master.ViewData) {
        didPresentAnimiesCalled = true
    }
    
    func presentError(errorString: String) {
        didPresentErrorCalled = true
    }
}
