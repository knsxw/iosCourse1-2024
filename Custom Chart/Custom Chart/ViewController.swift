//
//  ViewController.swift
//  Custom Chart
//
//  Created by Sasori on 7/9/2567 BE.
//

import UIKit
import Charts
import DGCharts

class ViewController: UIViewController {

    @IBOutlet weak var waterChart: LineChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setWaterChart() {
        let now = Date()
                let calendar = Calendar.current
                let startDate = calendar.date(bySettingHour: 6, minute: 0, second: 0, of: now)!
                let components = calendar.dateComponents([.hour], from: startDate, to: now)
                let numberOfHours = components.hour! + 1
                
                // Sample hourly data points (Replace with your actual data)
                let dataPoints = (0..<numberOfHours).map { hour -> ChartDataEntry in
                    let value = Double.random(in: 10...30) // Random values for demonstration
                    return ChartDataEntry(x: Double(hour), y: value)
                }
                
                let peakValues = [(hour: 2, value: 27.0), (hour: 3, value: 121.0)]
                
                let dataSet = LineChartDataSet(entries: dataPoints, label: "Hourly Water Consumption")
                dataSet.colors = [NSUIColor.blue] // Line color
                dataSet.valueColors = [NSUIColor.black] // Value text color
                
                let data = LineChartData(dataSet: dataSet)
                
                waterChart.data = data
                
                waterChart.rightAxis.enabled = false
                waterChart.xAxis.labelPosition = .bottom
    }
}

