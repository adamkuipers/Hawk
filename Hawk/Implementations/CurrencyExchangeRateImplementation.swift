//
//  CurrencyExchangeRateImplementation.swift
//  Money
//
//  Created by Adam Kuipers on 11/27/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

public struct CurrencyExchangeRate<Base: MoneyType, Counter: MoneyType where Base.MoneyRepresentation == Counter.MoneyRepresentation>: CurrencyExchangeRateType {
  public let base: Base
  public let counter: Counter

  public init(_ base: Base, toThe counter: Counter) {
    self.base = base
    self.counter = counter
  }

  public func convert(base: Base) -> Counter {
    return counter * (base / self.base)
  }

  public func convert(counter: Counter) -> Base {
    return base * (counter / self.counter)
  }
}
