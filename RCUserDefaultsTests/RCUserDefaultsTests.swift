//
//  RCUserDefaultsTests.swift
//  RCUserDefaultsTests
//
//  Created by roy.cao on 2019/3/24.
//  Copyright © 2019 roy. All rights reserved.
//

import XCTest
@testable import RCUserDefaults

class RCUserDefaultsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testString() {
        RCUserDefaults.standard.string = "string"
        XCTAssertEqual(RCUserDefaults.standard.string, "string")

        RCUserDefaults.standard.stringOptional = nil

        XCTAssertEqual(RCUserDefaults.standard.stringOptional, nil)
    }

    func testBool() {
        RCUserDefaults.standard.bool = true
        XCTAssertEqual(RCUserDefaults.standard.bool, true)

        XCTAssertEqual(RCUserDefaults.standard.bool2, false)
    }

    func testInt() {
        RCUserDefaults.standard.int = 1
        XCTAssertEqual(RCUserDefaults.standard.int, 1)

        XCTAssertEqual(RCUserDefaults.standard.int2, 0)
    }

    func testDouble() {
        RCUserDefaults.standard.double = 1
        XCTAssertEqual(RCUserDefaults.standard.double, 1)

        XCTAssertEqual(RCUserDefaults.standard.double2, 0)
    }

    func testFloat() {
        RCUserDefaults.standard.float = 1.0
        XCTAssertEqual(RCUserDefaults.standard.float, 1.0)

        XCTAssertEqual(RCUserDefaults.standard.float2, 0.0)
    }

    func testData() {
        let data = Data()
        RCUserDefaults.standard.data = data
        XCTAssertEqual(RCUserDefaults.standard.data, data)

        XCTAssertEqual(RCUserDefaults.standard.dataOptional, nil)
    }

    func testAny() {
        RCUserDefaults.standard.any = "any"
        XCTAssertEqual(RCUserDefaults.standard.any as! String, "any")

        XCTAssertEqual(RCUserDefaults.standard.anyOptional as? String, nil)
    }

    func testArray() {
        RCUserDefaults.standard.array = [1]
        XCTAssertEqual(RCUserDefaults.standard.array, [1])

        XCTAssertEqual(RCUserDefaults.standard.arrayOptional, nil)

        XCTAssertEqual(RCUserDefaults.standard.arrayEmpty, [])
    }

    func testDictionary() {
        RCUserDefaults.standard.dictionary = ["test": 1]
        XCTAssertEqual(RCUserDefaults.standard.dictionary, ["test": 1])

        XCTAssertEqual(RCUserDefaults.standard.dictionaryOptional, nil)

        XCTAssertEqual(RCUserDefaults.standard.dictionaryEmpty, [:])
    }
}

extension RCUserDefaults {

    @NSManaged var string: String
    @NSManaged var stringOptional: String?

    @NSManaged var bool: Bool
    @NSManaged var bool2: Bool

    @NSManaged var int: Int
    @NSManaged var int2: Int

    @NSManaged var double: Double
    @NSManaged var double2: Double

    @NSManaged var float: Float
    @NSManaged var float2: Float

    @NSManaged var data: Data
    @NSManaged var dataOptional: Data?

    @NSManaged var any: Any
    @NSManaged var anyOptional: Any?

    @NSManaged var array: [Int]
    @NSManaged var arrayOptional: [Int]?
    @NSManaged var arrayEmpty: [Int]

    @NSManaged var dictionary: [String: Int]
    @NSManaged var dictionaryOptional: [String: Int]?
    @NSManaged var dictionaryEmpty: [String: Int]
}
