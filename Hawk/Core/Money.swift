//
//  MoneyImplementation.swift
//  Hawk
//
//  Created by Adam Kuipers on 11/27/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

public struct Money<Currency: CurrencyType>: MoneyType {
  public typealias UnderlyingCurrency = Currency
  public typealias MoneyRepresentation = MoneyDecimalNumber

  internal let amount: MoneyDecimalNumber

  public init(_ double: Double) {
    self.init(MoneyDecimalNumber(double))
  }

  public init(_ amount: MoneyDecimalNumber) {
    self.amount = amount
  }

  public static var zero: Money {
    return Money(0)
  }

  public static var unit: Money {
    return Money(Currency.unit)
  }
}

// MARK: - Arithmentic Operators

@warn_unused_result
public func == <Currency: CurrencyType>(lhs: Money<Currency>, rhs: Money<Currency>) -> Bool {
  return lhs.amount == rhs.amount
}

@warn_unused_result
public func < <Currency: CurrencyType>(lhs: Money<Currency>, rhs: Money<Currency>) -> Bool {
  return lhs.amount < rhs.amount
}

@warn_unused_result
public prefix func - <Currency: CurrencyType>(rhs: Money<Currency>) -> Money<Currency> {
  return Money(.zero - rhs.amount)
}

@warn_unused_result
public func + <Currency: CurrencyType>(lhs: Money<Currency>, rhs: Money<Currency>) -> Money<Currency> {
  return Money(lhs.amount + rhs.amount)
}

@warn_unused_result
public func - <Currency: CurrencyType>(lhs: Money<Currency>, rhs: Money<Currency>) -> Money<Currency> {
  return Money(lhs.amount - rhs.amount)
}

@warn_unused_result
public func * <Currency: CurrencyType>(lhs: Money<Currency>, rhs: MoneyDecimalNumber) -> Money<Currency> {
  return Money(lhs.amount * rhs)
}

@warn_unused_result
public func / <Currency: CurrencyType>(lhs: Money<Currency>, rhs: MoneyDecimalNumber) -> Money<Currency> {
  return Money(lhs.amount / rhs)
}

@warn_unused_result
public func / <Currency: CurrencyType>(lhs: Money<Currency>, rhs: Money<Currency>) -> MoneyDecimalNumber {
  return lhs.amount / rhs.amount
}
