// Name - Khine Khant
// ID - 6611718

import UIKit
import Alamofire

struct Grade: Codable {
    let code: String
    let credit: Double
    let name: String
    let grade: String
}

struct Student: Codable {
    let name: String
    let grades: [Grade]
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var student: Student? = nil
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchGrades()
    }
    
    func fetchGrades() {
            AF.request("https://dl.dropboxusercontent.com/s/nsicnigp0xc8dxz/grades.json").responseDecodable(of: Student.self) { response in
            switch response.result {
            case .success(let student):
                self.student = student
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch data: \(error)")
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student?.grades.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GradeTableViewCell
        if let student = student {
            cell.code.text = student.grades[indexPath.row].code
            cell.credit.text = String(student.grades[indexPath.row].credit)
            cell.grade.text = student.grades[indexPath.row].grade
            cell.name.text = student.grades[indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

