//
//  GasStation.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-21.
//
/// https://leetcode.com/problems/gas-station/description/
import Foundation

class SolutionGasStation {
  func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    let n = gas.count
    var totalGas = 0
    var currentGas = 0
    var startStation = 0
    
    for i in 0..<n {
      let diff = gas[i] - cost[i]
      totalGas += diff
      currentGas += diff
      if currentGas < 0 {
        startStation = i + 1
        currentGas = 0
      }
    }
    return totalGas >= 0 ? startStation : -1
    
  }
}
