//
//  Subsets.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-11-05.
//https://leetcode.com/problems/partition-to-k-equal-sum-subsets/

import Foundation

func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
  let totalSum = nums.reduce(0, +)
  
  guard totalSum % k == 0 else { return false }
  let target = totalSum / k
  var used = [Bool](repeating: false, count: nums.count)
  
  func backtrack(_ startIndex: Int, _ currentSum: Int, _ remainingSets: Int) -> Bool {
    if remainingSets == 1 {
      return true
    }
    
    if currentSum == target {
      return backtrack(0, 0, remainingSets - 1)
    }
    
    for i in startIndex..<nums.count {
      if !used[i], currentSum + nums[i] <= target {
        used[i] = true
        if backtrack(i + 1, currentSum + nums[i], remainingSets) {
          return true
        }
        used[i] = false
      }
    }
    
    return false
  }
  
  return backtrack(0, 0, k)
}
//
//// Test cases
//let nums1 = [4, 3, 2, 3, 5, 2, 1]
//let k1 = 4
//let result1 = canPartitionKSubsets(nums1, k1)
//print("Output for nums1 and k1:", result1)
//
//let nums2 = [1, 2, 3, 4]
//let k2 = 3
//let result2 = canPartitionKSubsets(nums2, k2)
//print("Output for nums2 and k2:", result2)
