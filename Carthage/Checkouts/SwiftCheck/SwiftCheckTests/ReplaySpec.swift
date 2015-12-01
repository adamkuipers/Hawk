//
//  ReplaySpec.swift
//  SwiftCheck
//
//  Created by Robert Widmann on 11/18/15.
//  Copyright © 2015 Robert Widmann. All rights reserved.
//

import SwiftCheck

class ReplaySpec : XCTestCase {
	func testProperties() {
		property("Test is replayed at specific args") <- forAll { (seedl : Int, seedr : Int, size : Int) in
			let replayArgs = CheckerArguments(replay: .Some(StdGen(seedl, seedr), size))
			var foundArgs : [Int] = []
			property("Replay at \(seedl), \(seedr)", arguments: replayArgs) <- forAll { (x : Int) in
				foundArgs.append(x)
				return true
			}

			var foundArgs2 : [Int] = []
			property("Replay at \(seedl), \(seedr)", arguments: replayArgs) <- forAll { (x : Int) in
				foundArgs2.append(x)
				return foundArgs.contains(x)
			}

			return foundArgs == foundArgs2
		}
	}
}
