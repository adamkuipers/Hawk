//
//  UnderlyingMoneyRepresentation.swift
//  Hawk
//
//  Created by Adam Kuipers on 11/27/15.
//  Copyright © 2015 Adam Kuipers. All rights reserved.
//

public protocol UnderlyingMoneyRepresentationType: Comparable {
  init(_: Double)

  func - (lhs: Self, rhs: Self) -> Self
  func + (lhs: Self, rhs: Self) -> Self
  func * (lhs: Self, rhs: Self) -> Self
  func / (lhs: Self, rhs: Self) -> Self

  static var zero: Self { get }
}
