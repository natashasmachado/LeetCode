//
//  Repeated-String.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-11-05.
//https://leetcode.com/problems/repeated-string-match/

import Foundation

func repeatedStringMatch(_ a: String, _ b: String) -> Int {
  var repeatedA = a
  var count = 1
  
  while repeatedA.count < b.count {
    repeatedA += a
    count += 1
  }
  
  if repeatedA.range(of: b) != nil {
    return count
  }
  
  repeatedA += a
  count += 1
  
  if repeatedA.range(of: b) != nil {
    return count
  }
  
  return -1
}

//// Test cases
//let result1 = repeatedStringMatch("abcd", "cdabcdab")
//let result2 = repeatedStringMatch("a", "aa")
//
//print("Output for 'abcd', 'cdabcdab':", result1)
//print("Output for 'a', 'aa':", result2)
