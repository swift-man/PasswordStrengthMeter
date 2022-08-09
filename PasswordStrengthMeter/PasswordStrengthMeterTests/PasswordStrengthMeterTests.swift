//
//  PasswordStrengthMeterTests.swift
//  PasswordStrengthMeterTests
//
//  Created by SwiftMan on 2021/04/08.
//

import XCTest
@testable import PasswordStrengthMeter

class PasswordStrengthMeterTests: XCTestCase {
  let meter = PasswordStrengthMeter()
  
  private func assertStrength(password: String?, expStr: PasswordStrength) {
    let result2 = meter.meter(password)
    XCTAssertEqual(expStr, result2)
  }
  
  func testMeetsAllCriteria_then_strong() throws {
    assertStrength(password: "ab12!@AB",
                   expStr: .strong)
    assertStrength(password: "abc1!Add",
                   expStr: .strong)
  }
  
  func testMeetsOtherCriteria_except_for_length_then_normal() throws {
    assertStrength(password: "ab12!@A",
                   expStr: .normal)
    assertStrength(password: "Ab12!c",
                   expStr: .normal)
  }
  
  func testMeetsOtherCriteria_except_for_number_then_normal() throws {
    assertStrength(password: "ab!@ABqwer",
                   expStr: .normal)
  }
  
  func testNullInput_then_invalid() {
    assertStrength(password: nil,
                   expStr: .invalid)
  }
  
  func testEmptyInput_then_invalid() {
    assertStrength(password: "",
                   expStr: .invalid)
  }
  
  func testMeetsOtherCriteria_except_for_uppercase_then_normal() {
    assertStrength(password: "ab12!@df",
                   expStr: .normal)
  }
  
  func testMeetsOnlyLenthCriteria_then_weak() {
    assertStrength(password: "abdefghi",
                   expStr: .weak)
  }
  
  func testMeetsOnlyNumCriteria_then_weak() {
    assertStrength(password: "12345",
                   expStr: .weak)
  }
  
  func testMeetsOnlyUpperCriteria_then_weak() {
    assertStrength(password: "ABZEF",
                   expStr: .weak)
  }
  
  func testMeetsNoCriteria_then_weak() {
    assertStrength(password: "abc",
                   expStr: .weak)
  }
}
