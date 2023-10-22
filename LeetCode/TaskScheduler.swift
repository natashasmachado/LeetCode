//
//  Task Scheduler.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-21.
//
/// https://leetcode.com/problems/task-scheduler/description/
import Foundation

class SolutionLeastInterval {
  func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var taskCounts = [Int](repeating: 0, count: 26)
    for task in tasks {
      let taskIndex = Int(task.asciiValue! - Character("A").asciiValue!)
      taskCounts[taskIndex] += 1
    }
    taskCounts.sort(by: >)
    
    let maxCount = taskCounts[0]
    var idleSlots = (maxCount - 1) * n
    
    for i in 1..<taskCounts.count {
      idleSlots -= min(maxCount - 1, taskCounts[i])
    }
    
    idleSlots = max(0, idleSlots)
    
    return tasks.count + idleSlots
  }
  
}
