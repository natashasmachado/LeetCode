//
//  ShortestUnsortedSubarray.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-21.
// https://leetcode.com/problems/shortest-unsorted-continuous-subarray/

import Foundation

class SolutionShortestUnsortedSubarray {
  func findUnsortedSubarray(_ nums: [Int]) -> Int {
    let n = nums.count
    var left = 0
    var right = n - 1
    while left < n - 1 && nums[left] <= nums[left + 1] {
      left += 1
    }
    
    if left == n - 1 {
      return 0
    }
    
    while right > 0 && nums[right] >= nums[right - 1] {
      right -= 1
    }
    
    var minVal = nums[left...right].min()!
    var maxVal = nums[left...right].max()!
    
    while left >= 0 && nums[left] > minVal {
      left -= 1
    }
    
    while right < n && nums[right] < maxVal {
      right += 1
    }
    
    return right - left - 1
  }
}
