//
//  PartitionLabels.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-18.
//
/// https://leetcode.com/problems/partition-labels/

import Foundation

class SolutionPartitionLabels {
  func partitionLabels(_ s: String) -> [Int] {
    var lastIndices = [Int](repeating: 0, count: 26)
    for (index, char) in s.enumerated() {
      let charIndex = Int(char.asciiValue! - Character("a").asciiValue!)
      lastIndices[charIndex] = index
    }
    
    var partitions: [Int] = []
    var start = 0
    var end = 0
    for (index, char) in s.enumerated() {
      let charIndex = Int(char.asciiValue! - Character("a").asciiValue!)
      end = max(end, lastIndices[charIndex])
      
      if index == end {
        partitions.append(end - start + 1)
        start = end + 1
      }
    }
    
    return partitions
  }
}
