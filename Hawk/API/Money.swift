//
//  Money.swift
//  Hawk
//
//  Created by Adam Kuipers on 11/26/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

public protocol MoneyType: Comparable {
  typealias Currency: CurrencyType
  typealias MoneyRepresentation: UnderlyingMoneyRepresentation

  prefix func - (rhs: Self) -> Self
  func + (lhs: Self, rhs: Self) -> Self
  func - (lhs: Self, rhs: Self) -> Self
  func * (lhs: Self, rhs: MoneyRepresentation) -> Self
  func / (lhs: Self, rhs: MoneyRepresentation) -> Self
  func / (lhs: Self, rhs: Self) -> MoneyRepresentation

  static var zero: Self { get }
  static var unit: Self { get }
}

public extension MoneyType {
  public func absoluteValue() -> Self {
    if self < .zero {
      return -self
    } else {
      return self
    }
  }
}

public func * <M: MoneyType>(lhs: M.MoneyRepresentation, rhs: M) -> M {
    return rhs * lhs
}

public func * <M: MoneyType>(lhs: M, rhs: Double) -> M {
  return lhs * M.MoneyRepresentation(double: rhs)
}

public func * <M: MoneyType>(lhs: Double, rhs: M) -> M {
  return rhs * M.MoneyRepresentation(double: lhs)
}

public func / <M: MoneyType>(lhs: M, rhs: Double) -> M {
  return lhs / M.MoneyRepresentation(double: rhs)
}
