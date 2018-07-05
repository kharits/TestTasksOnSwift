//
//  _5AppsTasksTests.swift
//  65AppsTasksTests
//
//  Created by Sergey Kharitonov on 03.07.2018.
//  Copyright © 2018 Sergey Kharitonov. All rights reserved.
//

import XCTest
@testable import _5AppsTasks

var loginValidateTest : SKPasswordValidatorViewController!

class _5AppsTasksTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        loginValidateTest = SKPasswordValidatorViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFailFirstSymbol() {
        let isTest1 = loginValidateTest.validateLogin(login: "1serv")
        let isTest2 = loginValidateTest.validateLogin(login: ".serv")
        let isTest3 = loginValidateTest.validateLogin(login: "-serv")
        let isTest = isTest3 && isTest2 && isTest1
        XCTAssertEqual(isTest, false)
        
    }
    
    func testFailLenght() {
        let isTest1 = loginValidateTest.validateLogin(login: "ss")
        let isTest2 = loginValidateTest.validateLogin(login: "")
        let isTest3 = loginValidateTest.validateLogin(login: "qwertyuiopasdfghjklzxcvbnmqwertyuioasdf")
        let isTest = isTest3 && isTest2 && isTest1
        XCTAssertEqual(isTest, false)
    }
    
    func testEmail(){
        let isTest1 = loginValidateTest.validateLogin(login: "s2.ss@sss.ss")
        let isTest2 = loginValidateTest.validateLogin(login: "sss.ss@sss.ss")
        let isTest3 = loginValidateTest.validateLogin(login: "sds-sds.s@sds.ss")
        let isTest = isTest3 && isTest2 && isTest1
        XCTAssertEqual(isTest, true)
    }
    
    func testNickname(){
        let isTest1 = loginValidateTest.validateLogin(login: "server")
        let isTest2 = loginValidateTest.validateLogin(login: "server.server")
        let isTest3 = loginValidateTest.validateLogin(login: "server93.serv")
        let isTest = isTest3 && isTest2 && isTest1
        XCTAssertEqual(isTest, true)
    }
    
}
