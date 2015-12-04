//
//  MoneyDecimalNumber.swift
//  Hawk
//
//  Created by Adam Kuipers on 11/27/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

import Foundation

public struct MoneyDecimalNumber {
  let decimalNumber: NSDecimalNumber

  public init(_ double: Double) {
    self.init(NSDecimalNumber(double: double))
  }

  internal init(_ decimalNumber: NSDecimalNumber) {
    self.decimalNumber = decimalNumber
  }
}

// MARK: - UnderlyingMoneyRepresentation

extension MoneyDecimalNumber: UnderlyingMoneyRepresentationType {
  public static let zero: MoneyDecimalNumber = MoneyDecimalNumber(.zero())
}

@warn_unused_result
public func + (lhs: MoneyDecimalNumber, rhs: MoneyDecimalNumber) -> MoneyDecimalNumber {
  return MoneyDecimalNumber(lhs.decimalNumber.decimalNumberByAdding(rhs.decimalNumber))
}

@warn_unused_result
public func - (lhs: MoneyDecimalNumber, rhs: MoneyDecimalNumber) -> MoneyDecimalNumber {
  return MoneyDecimalNumber(lhs.decimalNumber.decimalNumberBySubtracting(rhs.decimalNumber))
}

@warn_unused_result
public func * (lhs: MoneyDecimalNumber, rhs: MoneyDecimalNumber) -> MoneyDecimalNumber {
  return MoneyDecimalNumber(lhs.decimalNumber.decimalNumberByMultiplyingBy(rhs.decimalNumber))
}

@warn_unused_result
public func / (lhs: MoneyDecimalNumber, rhs: MoneyDecimalNumber) -> MoneyDecimalNumber {
  return MoneyDecimalNumber(lhs.decimalNumber.decimalNumberByDividingBy(rhs.decimalNumber))
}

@warn_unused_result
public func == (lhs: MoneyDecimalNumber, rhs: MoneyDecimalNumber) -> Bool {
  return lhs.decimalNumber.isEqualToNumber(rhs.decimalNumber)
}

@warn_unused_result
public func < (lhs: MoneyDecimalNumber, rhs: MoneyDecimalNumber) -> Bool {
  return lhs.decimalNumber.compare(rhs.decimalNumber) == .OrderedAscending
}
