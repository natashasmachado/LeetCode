//
//  DeleteOperation.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-22.
// https://leetcode.com/problems/delete-operation-for-two-strings/description/

import Foundation

class SolutionDeleteO {
  func minDistance(_ word1: String, _ word2: String) -> Int {
    let m = word1.count
    let n = word2.count
    
    var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
    
    for i in 0...m {
      for j in 0...n {
        if i == 0 {
          dp[i][j] = j
        } else if j == 0 {
          dp[i][j] = i
        } else if word1[word1.index(word1.startIndex, offsetBy: i - 1)] == word2[word2.index(word2.startIndex, offsetBy: j - 1)] {
          dp[i][j] = dp[i - 1][j - 1]
        } else {
          dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + 1
        }
      }
    }
    
    return dp[m][n]
  }
  
}
