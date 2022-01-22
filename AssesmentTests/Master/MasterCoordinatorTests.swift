//
//  MasterCoordinatorTests.swift
//  AssesmentTests
//
//  Created by iQueue on 22/01/2022.
//

import XCTest
@testable import Assesment

class MasterCoordinatorTests: XCTestCase {
    
    var sut: MasterCoordinatorSpy!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MasterCoordinatorSpy()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStart_whenCalled_returnTrue() {
        // Act
        sut.start()
        
        // Assert
        XCTAssert(sut.startCalled, "func start() should be called ")
    }

}

class MasterCoordinatorSpy: MasterRouter {
 
    var startCalled = false
    
    
    func start() {
        startCalled = true
    }
}

