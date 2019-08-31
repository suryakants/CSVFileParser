//
//  CSVFileParserTest.swift
//  AssignmentTests
//
//  Created by Suryakant Sharma on 31/08/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import XCTest
@testable import Assignment


class CSVFileParserTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCleanData(){
        let str = "8719245200978;Rupesco BV;Via Vai;;NW 17-18;winter;10;15189-02;15189-02 Aviation Nero;Aviation;1;EU;38;38;EUR;;58.5;;139.95;Aviation;Woman Shoes\r"
        let expactedResult = "8719245200978;Rupesco BV;Via Vai;;NW 17-18;winter;10;15189-02;15189-02 Aviation Nero;Aviation;1;EU;38;38;EUR;;58.5;;139.95;Aviation;Woman Shoes\n"
        let parser = CSVFileParser()
        let result = parser.cleanRows(file: str)
        XCTAssert(result == expactedResult)
    }
    
    func testCleanDataWithTwoLineChange(){
        let str = "8719245200978;Rupesco BV;Via Vai;;NW 17-18;winter;10;15189-02;15189-02 Aviation Nero;Aviation;1;EU;38;38;EUR;;58.5;;139.95;Aviation;Woman Shoes\n\n"
        let expactedResult = "8719245200978;Rupesco BV;Via Vai;;NW 17-18;winter;10;15189-02;15189-02 Aviation Nero;Aviation;1;EU;38;38;EUR;;58.5;;139.95;Aviation;Woman Shoes\n"
        let parser = CSVFileParser()
        let result = parser.cleanRows(file: str)
        XCTAssert(result == expactedResult)
    }

}
