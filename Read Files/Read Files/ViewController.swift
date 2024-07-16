//
//  ViewController.swift
//  Read Files
//
//  Created by Sasori on 13/7/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var students : StudentsList? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        guard let txtContent = readTextFile(named: "Configuration", withExtension: "txt") else {
//            return
//        }
        students = readJSONFileForStudent(named: "Students", withExtension: "json")
        guard let jsonContent = readJSONFile(named: "Configuration", withExtension: "json") else {
            return
        }
       
//        let arr = txtContent.split(separator: ",")
        let color = jsonContent.color
                
        titleLabel.text = jsonContent.university
        subtitleLabel.text = jsonContent.app
                
        switch color {
        case "Red":
        view.backgroundColor = .red
        case "Blue":
        view.backgroundColor = .blue
        case "Yellow":
        view.backgroundColor = .yellow
        default:
        view.backgroundColor = .black
        }
        }
        
        
    func readTextFile(named fileName: String, withExtension fileExtension: String) -> String? {
            // Locate the file in the bundle
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                    // Read the contents of the file
                let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
                return fileContents
            } catch {
                print("Error reading file: \(error.localizedDescription)")
            }
        } else {
            print("File not found.")
        }
        return nil
    }
    
    // Function to read JSON file from the app bundle
    func readJSONFile(named fileName: String, withExtension fileExtension: String) -> AppInfo? {
        // Locate the file in the bundle
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: fileURL)
                // Decode the data to the AppInfo struct
                let appInfo = try JSONDecoder().decode(AppInfo.self, from: data)
                return appInfo
            } catch {
                print("Error reading or decoding file: \(error.localizedDescription)")
            }
        } else {
            print("File not found.")
        }
        return nil
    }
    
    func readJSONFileForStudent(named: String, withExtension: String) -> StudentsList? {
            if let fileURL = Bundle.main.url(forResource: named, withExtension: withExtension) {
                do {
                    let data = try Data(contentsOf: fileURL)
                    let decoder = JSONDecoder()
                    let studentsList = try decoder.decode(StudentsList.self, from: data)
                    return studentsList
                } catch {
                    print("Error reading or decoding file: \(error.localizedDescription)")
                    return nil
                }
            } else {
                print("File not found")
                return nil
            }
        }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students?.students.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        let cell = UITableViewCell()
        let message = "\(students?.students[index].name ?? "" ) is \(String(describing: students?.students[index].age ?? 0 )) years old. "
        cell.textLabel?.text = message
        return cell
    }
    
    
}
