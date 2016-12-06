//
//  ContractTests.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.8.0.10521 on 2016-12-06.
//  2016, SMART Health IT.
//

import XCTest
import SwiftFHIR


class ContractTests: XCTestCase {
	
	func instantiateFrom(filename: String) throws -> SwiftFHIR.Contract {
		return try instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) throws -> SwiftFHIR.Contract {
		return try SwiftFHIR.Contract(json: json)
	}
	
	func testContract1() {
		do {
			let instance = try runContract1()
			try runContract1(instance.asJSON())
		}
		catch let error {
			XCTAssertTrue(false, "Must instantiate and test Contract successfully, but threw:\n---\n\(error)\n---")
		}
	}
	
	@discardableResult
	func runContract1(_ json: FHIRJSON? = nil) throws -> SwiftFHIR.Contract {
		let inst = (nil != json) ? try instantiateFrom(json: json!) : try instantiateFrom(filename: "contract-example.json")
		
		XCTAssertEqual(inst.id, "C-123")
		XCTAssertEqual(inst.text?.div, "<div xmlns=\"http://www.w3.org/1999/xhtml\">A human-readable rendering of the contract</div>")
		XCTAssertEqual(inst.text?.status, NarrativeStatus(rawValue: "generated")!)
		
		return inst
	}
}
