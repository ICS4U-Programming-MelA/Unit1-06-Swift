// Copyright (c) 2021 Mel Aguoth All rights reserved.
//
// Created By: Mel Aguoth
// Date: January 5, 2022
// Calculates the mean, median, and mode of numbers taken from one of three files.

// Imports modules.
import Foundation

func calcMean(numberArray: [Int]) -> Double {

  // Declare constants.
  let meanDivisor: Double = Double(numberArray.count)

  // Declare variables.
  var sum: Int = 0

  // Calculate the mean.
  for number in numberArray {
    sum += number
  }
  let mean: Double = Double(sum) / meanDivisor

  // Return the mean.
  return mean
}

func calcMedian(numberArray: [Int]) -> Double {

  // Declare constants.
  let medianDividend: Int = numberArray.count

  // Declare variables.
  var median: Double = 0

  // Calculate the median.
  if medianDividend % 2 != 0 {
    median = Double(medianDividend / 2)
  } else {
    median = Double((numberArray[(medianDividend - 1) / 2]
                    + numberArray[medianDividend / 2]) / 2)
  }

  // Return the median.
  return median
}

func calcMode(numberArray: [Int]) -> [Int] {

  // Declare variables.
  var counts = [Int: Int]()

  // Find the mode(s).
  numberArray.forEach { counts[$0] = (counts[$0] ?? 0) + 1}
  let (_, count) = counts.max(by: {$0.1 < $1.1}) ?? (0, 0)
  var modes = counts.compactMap { $1 == count ? $0 : nil}

  // Sort the array of modes(s).
  modes.sort()

  // Return the mode(s).
  return modes
}
// Introduce the program.
print("This program calculates the mean, median and mode of numbers it takes from a chosen"
    + " text file.")

// Get the user's specified text file.
print("Enter the text file you wish to use (set1, set2, or set3):", terminator: " ")
let userSetChoice: String = readLine() ?? ""

// Add the numbers from the user's chosen text file to the array.
let file: String = try String(contentsOfFile: userSetChoice)
let userNumberArray: [String] = file.components(separatedBy: "\n")
var userNumberArrayInt: [Int] = userNumberArray.compactMap {Int($0)}

// Display the number array to the user.
print(userNumberArrayInt)

// Call calcMean, calcMedian, and calcMode.
let setMean: Double = calcMean(numberArray: userNumberArrayInt)
let setMedian: Double = calcMedian(numberArray: userNumberArrayInt)
let setMode: [Int] = calcMode(numberArray: userNumberArrayInt)

// Display the mean, median, and mode.
print("\n" + "The mean is: \(setMean)")
print("The median is: \(setMedian)")
print("The mode(s) is/are: \(setMode)")
