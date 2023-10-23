//
//  SumSquareNumbers.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-22.
//https://leetcode.com/problems/sum-of-square-numbers/description/

import Foundation

class SolutionSumSquareNumbers {
  func judgeSquareSum(_ c: Int) -> Bool {
    if c < 0 {
      return false
    }
    
    var left = 0
    var right = Int(sqrt(Double(c)))
    
    while left <= right {
      let currentSum = left * left + right * right
      if currentSum == c {
        return true
      } else if currentSum < c {
        left += 1
      } else {
        right -= 1
      }
    }
    
    return false
  }
}
