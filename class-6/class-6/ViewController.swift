//
//  ViewController.swift
//  class-6
//
//  Created by Sasori on 6/7/2567 BE.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let courses: [Course] = [Course(title: "English-1", grade: "B"), Course(title: "IOS Development", grade: "A"), Course(title: "Software Engineering", grade: "B+"), Course(title: "Cat Petting", grade: "C")]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GradeTableViewCell
        cell.courseLabel.text = courses[indexPath.row].title
        cell.gradeLabel.text = courses[indexPath.row].grade
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thirdPage = UIStoryboard(name: "Main", bundle: .main)
                    .instantiateViewController(withIdentifier: "thirdPage") as! ThirdPageViewController
        navigationController?.pushViewController(thirdPage, animated: true)
        thirdPage.course = courses[indexPath.row]
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .orange
        appearance.titleTextAttributes = [.foregroundColor: UIColor.green]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.purple]
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addClicked))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editClicked))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
//        tableView.separatorStyle = .none
    }
    @objc func addClicked() {
        let thirdPage = UIStoryboard(name: "Main", bundle: .main)
                    .instantiateViewController(withIdentifier: "thirdPage") as! ThirdPageViewController
        navigationController?.pushViewController(thirdPage, animated: true)
    }
    @objc func editClicked() {
        
    }
    @IBAction func nextClicked(_ sender: Any) {
        let secondPage = UIStoryboard(name: "Main", bundle: .main)
                    .instantiateViewController(withIdentifier: "secondPage") as! SecondPageViewController
        navigationController?.pushViewController(secondPage, animated: true)
    }
}

