//
//  MasterInteractorTests.swift
//  AssesmentTests
//
//  Created by Joseph on 22/01/2022.
//

import XCTest
@testable import Assesment

class MasterInteractorTests: XCTestCase {
    
    var sut: MasterInteractorSpy!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MasterInteractorSpy()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewDidLoad_whenCalled_returnTrue() {
        // Act
        sut.viewDidLoad()
        
        // Assert
        XCTAssert(sut.viewDidLoadCalled, "func viewDidLoad() should be called ")
    }
    
    func testSearchAnimie_whenCalled_returnTrue() {
        // Act
        sut.searchAnimesWith(text: "Goku")
        
        // Assert
        XCTAssert(sut.searchAnimesCalled, "sut.searchAnimesWith(text: String) should be called ")
    }

}

class MasterInteractorSpy: MasterInteractorProtocol {
    
    var presenter: MasterPresentationProtocol?
    var viewDidLoadCalled = false
    var searchAnimesCalled = false

    
    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    
    func searchAnimesWith(text: String) {
        searchAnimesCalled = true
    }
}
