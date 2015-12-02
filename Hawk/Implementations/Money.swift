//
//  MoneyImplementation.swift
//  Hawk
//
//  Created by Adam Kuipers on 11/27/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

public struct Money<C: CurrencyType>: MoneyType {
  public typealias Currency = C
  public typealias MoneyRepresentation = MoneyDecimalNumber

  private let amount: MoneyDecimalNumber

  public static var zero: Money {
    return Money(amount: MoneyDecimalNumber(double: 0))
  }

  public static var unit: Money {
    return Money(amount: MoneyDecimalNumber(double: Currency.unit))
  }
}

// MARK: - Arithmentic Operators

public func == <Currency: CurrencyType>(lhs: Money<Currency>, rhs: Money<Currency>) -> Bool {
  return lhs.amount == rhs.amount
}

public func < <Currency: CurrencyType>(lhs: Money<Currency>, rhs: Money<Currency>) -> Bool {
  return lhs.amount < rhs.amount
}

public prefix func - <Currency: CurrencyType>(rhs: Money<Currency>) -> Money<Currency> {
  return Money(amount: .zero - rhs.amount)
}

public func + <Currency: CurrencyType>(lhs: Money<Currency>, rhs: Money<Currency>) -> Money<Currency> {
  return Money(amount: lhs.amount + rhs.amount)
}

public func - <Currency: CurrencyType>(lhs: Money<Currency>, rhs: Money<Currency>) -> Money<Currency> {
  return Money(amount: lhs.amount - rhs.amount)
}

public func * <Currency: CurrencyType>(lhs: Money<Currency>, rhs: MoneyDecimalNumber) -> Money<Currency> {
  return Money(amount: lhs.amount * rhs)
}

public func / <Currency: CurrencyType>(lhs: Money<Currency>, rhs: MoneyDecimalNumber) -> Money<Currency> {
  return Money(amount: lhs.amount / rhs)
}

public func / <Currency: CurrencyType>(lhs: Money<Currency>, rhs: Money<Currency>) -> MoneyDecimalNumber {
  return lhs.amount / rhs.amount
}
