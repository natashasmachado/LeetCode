//
//  Frequent-words.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-11-05.
//https://leetcode.com/problems/top-k-frequent-words/

import Foundation

func topKFrequent(_ words: [String], _ k: Int) -> [String] {
  var wordCount = [String: Int]()
  
  for word in words {
    wordCount[word, default: 0] += 1
  }
  
  let sortedWords = wordCount.sorted { first, second in
    if first.value == second.value {
      return first.key < second.key
    }
    return first.value > second.value
  }
  
  var result = [String]()
  var count = 0
  for (word, _) in sortedWords {
    if count < k {
      result.append(word)
      count += 1
    } else {
      break
    }
  }
  
  return result
}
//
//// Test cases
//let words1 = ["i", "love", "leetcode", "i", "love", "coding"]
//let k1 = 2
//let result1 = topKFrequent(words1, k1)
//print("Output for words1 and k1:", result1)
//
//let words2 = ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"]
//let k2 = 4
//let result2 = topKFrequent(words2, k2)
//print("Output for words2 and k2:", result2)
