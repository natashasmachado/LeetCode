//
//  SumPairs.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-22.
//https://leetcode.com/problems/map-sum-pairs/

import Foundation

class TrieNode {
  var children: [Character: TrieNode] = [:]
  var value: Int = 0
}

class MapSum {
  private var root: TrieNode = TrieNode()
  
  func insert(_ key: String, _ val: Int) {
    var node = root
    for char in key {
      if let child = node.children[char] {
        node = child
      } else {
        let newChild = TrieNode()
        node.children[char] = newChild
        node = newChild
      }
    }
    node.value = val
  }
  
  func sum(_ prefix: String) -> Int {
    var node = root
    for char in prefix {
      if let child = node.children[char] {
        node = child
      } else {
        return 0
      }
    }
    return getSum(node)
  }
  
  private func getSum(_ node: TrieNode) -> Int {
    var sum = node.value
    for child in node.children.values {
      sum += getSum(child)
    }
    return sum
  }
}

/**
 * Your MapSum object will be instantiated and called as such:
 * let obj = MapSum()
 * obj.insert(key, val)
 * let ret_2: Int = obj.sum(prefix)
 */
