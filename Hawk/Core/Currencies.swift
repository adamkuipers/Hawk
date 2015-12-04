//
//  CurrencyImplementation.swift
//  Hawk
//
//  Created by Adam Kuipers on 11/27/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

public struct USD: CurrencyType {
  public static let code = "USD"
  public static let formatDecimals = 2
  public static let name = "US Dollar"
  public static let symbol = "$"
  public static let unit: Double = 1
}

public struct JPY: CurrencyType {
  public static let code = "JPY"
  public static let formatDecimals = 2
  public static let name = "Japanese Yen"
  public static let symbol = "¥"
  public static let unit: Double = 100
}
