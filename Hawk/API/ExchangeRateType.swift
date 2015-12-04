//
//  CurrencyExchangeRate.swift
//  Hawk
//
//  Created by Adam Kuipers on 11/27/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

public protocol ExchangeRateType {
  typealias Base: MoneyType
  typealias Counter: MoneyType

  init(_: Base, toThe: Counter)

  var base: Base { get }
  var counter: Counter { get }

  func convert(base: Base) -> Counter
  func convert(counter: Counter) -> Base
}
