//
//  SolveEquation.swift
//  LeetCode
//
//  Created by Natasha Machado on 2023-10-22.
//https://leetcode.com/problems/solve-the-equation/

import Foundation
class SolutionEquation {
  func solveEquation(_ equation: String) -> String {
    let sides = equation.components(separatedBy: "=")
    let leftSide = sides[0]
    let rightSide = sides[1]
    let leftCoefficients = parse(leftSide)
    let rightCoefficients = parse(rightSide)
    let a = leftCoefficients.0 - rightCoefficients.0
    let b = rightCoefficients.1 - leftCoefficients.1
    
    if a == 0 {
      if b == 0 {
        return "Infinite solutions"
      } else {
        return "No solution"
      }
    } else {
      let xValue = b / a
      return "x=\(xValue)"
    }
  }
  
  func parse(_ side: String) -> (Int, Int) {
    var coefficients = (0, 0)
    var currentNumber = ""
    var isPositive = true
    
    for char in side {
      if char == "x" {
        if currentNumber.isEmpty {
          if isPositive {
            coefficients.0 += 1
          } else {
            coefficients.0 -= 1
          }
        } else {
          let coefficient = isPositive ? Int(currentNumber)! : -Int(currentNumber)!
          coefficients.0 += coefficient
        }
        currentNumber = ""
      } else if char == "+" {
        isPositive = true
      } else if char == "-" {
        isPositive = false
      } else {
        currentNumber.append(char)
      }
    }
    
    if !currentNumber.isEmpty {
      coefficients.1 = isPositive ? Int(currentNumber)! : -Int(currentNumber)!
    }
    
    return coefficients
  }
}
