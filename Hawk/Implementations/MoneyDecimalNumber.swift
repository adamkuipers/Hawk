//
//  MoneyDecimalNumber.swift
//  Money
//
//  Created by Adam Kuipers on 11/27/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

import Foundation

public struct MoneyDecimalNumber {
  let decimalNumber: NSDecimalNumber

  public init(double: Double) {
    self.init(NSDecimalNumber(double: double))
  }

  init(_ decimalNumber: NSDecimalNumber) {
    self.decimalNumber = decimalNumber
  }
}

// MARK: UnderlyingMoneyRepresentation

extension MoneyDecimalNumber: UnderlyingMoneyRepresentation {
  public static let zero: MoneyDecimalNumber = MoneyDecimalNumber(.zero())
}

// MARK: - Arithmetic Operators

public func + (lhs: MoneyDecimalNumber, rhs: MoneyDecimalNumber) -> MoneyDecimalNumber {
  return MoneyDecimalNumber(lhs.decimalNumber.decimalNumberByAdding(rhs.decimalNumber))
}

public func - (lhs: MoneyDecimalNumber, rhs: MoneyDecimalNumber) -> MoneyDecimalNumber {
  return MoneyDecimalNumber(lhs.decimalNumber.decimalNumberBySubtracting(rhs.decimalNumber))
}

public func * (lhs: MoneyDecimalNumber, rhs: MoneyDecimalNumber) -> MoneyDecimalNumber {
  return MoneyDecimalNumber(lhs.decimalNumber.decimalNumberByMultiplyingBy(rhs.decimalNumber))
}

public func / (lhs: MoneyDecimalNumber, rhs: MoneyDecimalNumber) -> MoneyDecimalNumber {
  return MoneyDecimalNumber(lhs.decimalNumber.decimalNumberByDividingBy(rhs.decimalNumber))
}

public func == (lhs: MoneyDecimalNumber, rhs: MoneyDecimalNumber) -> Bool {
  return lhs.decimalNumber.isEqualToNumber(rhs.decimalNumber)
}

public func < (lhs: MoneyDecimalNumber, rhs: MoneyDecimalNumber) -> Bool {
  return lhs.decimalNumber.compare(rhs.decimalNumber) == .OrderedAscending
}
