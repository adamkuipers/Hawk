//
//  Currency.swift
//  Hawk
//
//  Created by Adam Kuipers on 11/27/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

public protocol CurrencyType {
  static var code: String { get }
  static var formatDecimals: Int { get }
  static var name: String { get }
  static var symbol: String { get }
  static var unit: Double { get }
}
