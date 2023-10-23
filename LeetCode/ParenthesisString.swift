//
//  ParenthesisString.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-22.
//

import Foundation

class SolutionParenthesisString {
  func checkValidString(_ s: String) -> Bool {
    var leftMin = 0
    var leftMax = 0
    
    for char in s {
      if char == "(" {
        leftMin += 1
        leftMax += 1
      } else if char == ")" {
        leftMin = max(leftMin - 1, 0)
        leftMax -= 1
      } else {
        leftMin = max(leftMin - 1, 0)
        leftMax += 1
      }
      
      if leftMax < 0 {
        return false
      }
    }
    
    return leftMin == 0
  }
}
