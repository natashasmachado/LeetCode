//
//  Stickers-word.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-11-05.
// https://leetcode.com/problems/stickers-to-spell-word/

import Foundation

func minStickers(_ stickers: [String], _ target: String) -> Int {
  var memo = [String: Int]()
  
  func backtrack(_ memo: inout [String: Int], _ stickers: [String], _ target: String) -> Int {
    if target.isEmpty {
      return 0
    }
    
    if let val = memo[target] {
      return val
    }
    
    var result = Int.max
    let tFreq = getFreq(target)
    
    for sticker in stickers {
      if sticker.contains(target.first!) {
        var newTarget = ""
        for (c, count) in tFreq {
          let charCount = max(0, count - sticker.filter { $0 == c }.count)
          newTarget.append(String(repeating: c, count: charCount))
        }
        
        if newTarget.count != target.count {
          let res = backtrack(&memo, stickers, newTarget)
          if res != -1 {
            result = min(result, res + 1)
          }
        }
      }
    }
    
    memo[target] = result == Int.max ? -1 : result
    return memo[target]!
  }
  
  return backtrack(&memo, stickers, target)
}

func getFreq(_ str: String) -> [Character: Int] {
  var freq = [Character: Int]()
  for char in str {
    freq[char, default: 0] += 1
  }
  return freq
}
//
//// Test cases
//let stickers1 = ["with", "example", "science"]
//let target1 = "thehat"
//let result1 = minStickers(stickers1, target1)
//print("Output for stickers1 and target1:", result1)
//
//let stickers2 = ["notice", "possible"]
//let target2 = "basicbasic"
//let result2 = minStickers(stickers2, target2)
//print("Output for stickers2 and target2:", result2)
