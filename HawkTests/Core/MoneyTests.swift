//
//  MoneyTests.swift
//  Hawk
//
//  Created by Adam Kuipers on 12/1/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

@testable import Hawk

import XCTest
import SwiftCheck

private func usdFromDouble(value: Double) -> Money<USD> {
  return Money(value)
}

final class MoneyTests: XCTestCase {
  func testMultiplication() {
    property("Multiplication scales money correctly") <- forAll { (value: Double, number: Double) in
      usdFromDouble(value) * number == Money(MoneyDecimalNumber(value) * MoneyDecimalNumber(number))
    }

    property("Multiplication is commutative") <- forAll { (money: Money<USD>, number: Double) in
      let moneyDecimalProduct = money * MoneyDecimalNumber(number) == MoneyDecimalNumber(number) * money
      let doubleProduct = money * number == number * money
      return doubleProduct && moneyDecimalProduct
    }

    property("Multiplication identity property holds") <- forAll { (number: Double) in
      .unit * number == usdFromDouble(number)
    }
  }

  func testDivision() {
    property("Division scales money correctly") <- forAll { (value: Double, number: Double) in
      number != 0 ==>
        usdFromDouble(value) / number == Money(MoneyDecimalNumber(value) / MoneyDecimalNumber(number))
    }

    property("Unit eliminating division scales underlying representation correctly") <- forAll { (money1: Money<USD>, money2: Money<USD>) in
      money2.amount > .zero ==>
        money1 / money2 == money1.amount / money2.amount
    }
  }

  func testAddition() {
    property("Addition calculates sum of underlying representation") <- forAll { (money1: Money<USD>, money2: Money<USD>) in
      money1 + money2 == Money(money1.amount + money2.amount)
    }

    property("Addition identity property holds") <- forAll { (money: Money<USD>) in
      money + .zero == money
    }
  }

  func testSubtraction() {
    property("Subtraction calculates difference of underlying representation") <- forAll { (money1: Money<USD>, money2: Money<USD>) in
      money1 - money2 == Money(money1.amount - money2.amount)
    }

    property("Subtraction identity property holds") <- forAll { (money: Money<USD>) in
      money - .zero == money
    }
  }

  func testInversion() {
    property("Inversion inverts underlying representation") <- forAll { (money: Money<USD>) in
      -money == Money(.zero - money.amount)
    }
  }

  func testLessThan() {
    property("Less than relationship corresponds to the same in the underlying rep.") <- forAll { (money1: Money<USD>, money2: Money<USD>) in
      money1 < money2 ==>
        money1.amount.decimalNumber.doubleValue < money2.amount.decimalNumber.doubleValue
    }
  }

  func testAbsoluteValue() {
    property("Absolute value always results in a positibe number") <- forAll { (value: Double) in
      usdFromDouble(value).absoluteValue() == usdFromDouble(abs(value))
    }
  }
}
