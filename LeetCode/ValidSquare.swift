//
//  ValidSquare.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-22.
//https://leetcode.com/problems/valid-square/description/

import Foundation

class Solution {
  func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
    func distance(_ a: [Int], _ b: [Int]) -> Int {
      return (a[0] - b[0]) * (a[0] - b[0]) + (a[1] - b[1]) * (a[1] - b[1])
    }
    
    let points = [p1, p2, p3, p4]
    var distances = Set<Int>()
    
    for i in 0..<4 {
      for j in i + 1..<4 {
        let dist = distance(points[i], points[j])
        if dist == 0 {
          return false
        }
        distances.insert(dist)
      }
    }
    
    return distances.count == 2
  }
}

