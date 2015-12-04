//
//  ArbitraryExtensions.swift
//  Hawk
//
//  Created by Adam Kuipers on 12/3/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

@testable import Hawk

import SwiftCheck

extension Money: Arbitrary {
  public static var arbitrary: Gen<Money> {
    return Double.arbitrary.fmap { Money($0) }
  }

  public static func shrink(money: Money) -> [Money] {
    return Double.shrink(money.amount.decimalNumber.doubleValue).map { double in
      Money(double)
    }
  }
}

internal struct ArbitraryEchangeRate<BaseCurrency: CurrencyType, CounterCurrency: CurrencyType>: Arbitrary {
  let exchangeRate: ExchangeRate<Money<BaseCurrency>, Money<CounterCurrency>>

  init(_ exchangeRate: ExchangeRate<Money<BaseCurrency>, Money<CounterCurrency>>) {
    self.exchangeRate = exchangeRate
  }

  static func create
    (base: Money<BaseCurrency>)
    (counter: Money<CounterCurrency>)
  -> ArbitraryEchangeRate {
    return ArbitraryEchangeRate(ExchangeRate(base, toThe: counter))
  }

  static var arbitrary: Gen<ArbitraryEchangeRate> {
    return ArbitraryEchangeRate.create
       <^> Money<BaseCurrency>.arbitrary
       <*> Money<CounterCurrency>.arbitrary
  }
}
