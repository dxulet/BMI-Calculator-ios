//
//  CalcBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Daulet Ashikbayev on 29.04.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

struct CalcBrain {
    var bmi: BMI?
    
    mutating func getBMIValue() -> String {
        let bmiTo1Decimal1Place = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1Decimal1Place
    }
    
    func getAdvice() -> String? {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor? {
        return bmi?.color ?? UIColor.white
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        let color = (underweight: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), healthy: #colorLiteral(red: 0, green: 0.6497960091, blue: 0.2595743835, alpha: 1), overweight: #colorLiteral(red: 0.8467391729, green: 0.1176478192, blue: 0, alpha: 1))
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: color.underweight)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: color.healthy)
        } else {
            bmi = (BMI(value: bmiValue, advice: "What a fatass!", color: color.overweight))
        }
    }
}
