//
//  UnderlyingMoneyRepresentation.swift
//  Money
//
//  Created by Adam Kuipers on 11/27/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

public protocol UnderlyingMoneyRepresentation: Comparable {
  init(double: Double)

  func - (lhs: Self, rhs: Self) -> Self
  func + (lhs: Self, rhs: Self) -> Self
  func * (lhs: Self, rhs: Self) -> Self
  func / (lhs: Self, rhs: Self) -> Self

  static var zero: Self { get }
}
