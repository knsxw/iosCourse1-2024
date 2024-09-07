//
//  ViewController.swift
//  ThreeCharts
//
//  Created by Sasori on 7/9/2567 BE.
//

import UIKit
import Charts
import DGCharts

class ViewController: UIViewController {

    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLineChart()
        setupBarChart()
        setupPieChart()
    }
    
    func setupLineChart() {
        
        var lineEntries = [ChartDataEntry]()
        
        var x : [Double]
        var y : [Double]
        x = [0, 1, 2, 3]
        y = [10, 14, 12, 18]
        
        for i in 0..<x.count {
            let value = ChartDataEntry(x: Double(x[i]), y: y[i])
            lineEntries.append(value)
        }
            
        let lineDataSet = LineChartDataSet(entries: lineEntries, label: "Line Chart")
        let lineData = LineChartData(dataSet: lineDataSet)
        lineChartView.data = lineData
    }
    
    func setupBarChart() {
        
        var barEntries = [BarChartDataEntry]()
        
        var x : [Double]
        var y : [Double]
        x = [0, 1, 2, 3]
        y = [10, 14, 12, 18]
        
        for i in 0..<x.count {
            let value = BarChartDataEntry(x: x[i], y: y[i])
            barEntries.append(value)
        }
            
        let barDataSet = BarChartDataSet(entries: barEntries, label: "Prices")
        let barData = BarChartData(dataSet: barDataSet)
        barChartView.data = barData
    }

    func setupPieChart() {

        var pieEntries = [PieChartDataEntry]()
        var values : [Double]
        values = [40, 30, 15, 15]
        let labels = ["John", "Jack", "James", "Joy"]
        for i in 0..<values.count {
                let entry = PieChartDataEntry(value: values[i], label: labels[i])
                pieEntries.append(entry)
            }
            
        let pieDataSet = PieChartDataSet(entries: pieEntries, label: "DataSet")
        pieDataSet.colors = ChartColorTemplates.colorful()
        let pieData = PieChartData(dataSet: pieDataSet)
        pieChartView.data = pieData
    }
}

