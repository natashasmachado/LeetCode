//
//  RedundantConnection.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-30.
//https://leetcode.com/problems/redundant-connection/description/
/// RedundantConnection
import Foundation

class UnionFind {
  var parent: [Int]
  
  init(_ n: Int) {
    parent = Array(0...n)
  }
  
  func find(_ x: Int) -> Int {
    if parent[x] != x {
      parent[x] = find(parent[x])
    }
    return parent[x]
  }
  
  func union(_ x: Int, _ y: Int) {
    let rootX = find(x)
    let rootY = find(y)
    
    if rootX != rootY {
      parent[rootX] = rootY
    }
  }
}

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
  let n = edges.count
  let uf = UnionFind(n)
  var result = [Int]()
  
  for edge in edges {
    let x = edge[0]
    let y = edge[1]
    
    if uf.find(x) == uf.find(y) {
      result = [x, y]
    } else {
      uf.union(x, y)
    }
  }
  
  return result
}
//
//let edges1 = [[1, 2], [1, 3], [2, 3]]
//let result1 = findRedundantConnection(edges1)
//print("Output:", result1)
//
//let edges2 = [[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]]
//let result2 = findRedundantConnection(edges2)
//print("Output:", result2) 
