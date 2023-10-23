//
//  ClosestElement.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-22.
//https://leetcode.com/problems/find-k-closest-elements/description/

import Foundation

class SolutionClosestElement {
  func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    let n = arr.count
    var left = 0
    var right = n - 1
    
    while right - left + 1 > k {
      let leftDist = abs(arr[left] - x)
      let rightDist = abs(arr[right] - x)
      
      if leftDist > rightDist {
        left += 1
      } else {
        right -= 1
      }
    }
    
    return Array(arr[left...right])
  }
}
