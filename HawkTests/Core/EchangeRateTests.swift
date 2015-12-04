//
//  EchangeRateTests.swift
//  Hawk
//
//  Created by Adam Kuipers on 12/3/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

@testable import Hawk

import XCTest
import SwiftCheck

final class EchangeRateTests: XCTestCase {
  func testConvertBaseToCounter() {
    let baseUSD: Money<USD> = .unit
    let baseJPY: Money<JPY> = Money(123.16)
    let exchangeRate: ExchangeRate<Money<USD>, Money<JPY>> = ExchangeRate(baseUSD, toThe: baseJPY)

    property("Convert USD to JPY") <- forAll { (usd: Money<USD>) in
      exchangeRate.convert(usd) == Money(usd.amount * baseJPY.amount)
    }

    property("Convert JPY to USD") <- forAll { (jpy: Money<JPY>) in
      exchangeRate.convert(jpy) == Money(jpy.amount / baseJPY.amount)
    }
  }
}
