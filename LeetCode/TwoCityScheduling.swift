//
//  TwoCityScheduling.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-21.
//
/// https://leetcode.com/problems/two-city-scheduling/description/
import Foundation

class SolutionTwoCity {
  func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    let n = costs.count / 2
    var totalCost = 0
    
    let sortedCosts = costs.sorted { ($0[0] - $0[1]) < ($1[0] - $1[1]) }
    
    for i in 0..<n {
      totalCost += sortedCosts[i][0] + sortedCosts[i + n][1]
    }
    
    return totalCost
  }
}
