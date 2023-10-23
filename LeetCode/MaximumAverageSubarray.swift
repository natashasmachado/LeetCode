//
//  MaximumAverageSubarray.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-21.
//https://leetcode.com/problems/maximum-average-subarray-i/description/

import Foundation
class SolutionMaximumAverageSubarray {
  func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    var maxAverage: Double = Double(Int.min)
    var currentSum: Double = 0
    
    for i in 0..<k {
      currentSum += Double(nums[i])
    }
    
    for i in k..<nums.count {
      maxAverage = max(maxAverage, currentSum / Double(k))
      currentSum += Double(nums[i]) - Double(nums[i - k])
    }
    maxAverage = max(maxAverage, currentSum / Double(k))
    return maxAverage
  }
}
