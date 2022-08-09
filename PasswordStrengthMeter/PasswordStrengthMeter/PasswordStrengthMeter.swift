//
//  PasswordStrengthMeter.swift
//  PasswordStrengthMeter
//
//  Created by SwiftMan on 2021/04/08.
//

import Foundation

class PasswordStrengthMeter {
  func meter(_ s: String?) -> PasswordStrength {
    guard let s = s, !s.isEmpty else { return .invalid }
    
    let metCounts = metCriteriaCounts(s)
    
    if metCounts <= 1 {
      return .weak
    }
    
    if metCounts == 2 {
      return .normal
    }
    
    return .strong
  }
  
  private func meetsContainingNumberCriteria(_ s: String) -> Bool {
    for ch in s {
      if ch >= "0" && ch <= "9" {
        return true
      }
    }
    
    return false
  }
  
  private func meetsContainingUppercaseCriteria(_ s: String) -> Bool {
    for ch in s {
      if ch.isUppercase {
        return true
      }
    }
    
    return false
  }
  
  private func metCriteriaCounts(_ s: String) -> Int {
    var metCounts = 0
    if s.count >= 8 {
      metCounts += 1
    }
    let containsNum = meetsContainingNumberCriteria(s)
    if containsNum {
      metCounts += 1
    }
    let containsUpp = meetsContainingUppercaseCriteria(s)
    if containsUpp {
      metCounts += 1
    }
    
    return metCounts
  }
}
