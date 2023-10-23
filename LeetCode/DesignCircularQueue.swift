//
//  DesignCircularQueue.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-21.
//
/// https://leetcode.com/problems/design-circular-queue/description/
import Foundation

class MyCircularQueue {
  private var queue: [Int]
  private var front: Int
  private var rear: Int
  private var size: Int
  
   init(_ k: Int) {
    queue = Array(repeating: 0, count: k)
    front = -1
    rear = -1
    size = k
  }
  
  func enQueue(_ value: Int) -> Bool {
    if isFull() {
      return false
    }
    if isEmpty() {
      front = 0
    }
    rear = (rear + 1) % size
    queue[rear] = value
    return true
  }
  
  func deQueue() -> Bool {
    if isEmpty() {
      return false
    }
    if front == rear {
      front = -1
      rear = -1
    } else {
      front = (front + 1) % size
    }
    return true
  }
  
  func Front() -> Int {
    if isEmpty() {
      return -1
    }
    return queue[front]
  }
  
  func Rear() -> Int {
    if isEmpty() {
      return -1
    }
    return queue[rear]
  }
  
  func isEmpty() -> Bool {
    return front == -1
  }
  
  func isFull() -> Bool {
    return (rear + 1) % size == front
  }
}
