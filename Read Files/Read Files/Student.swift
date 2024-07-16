//
//  Student.swift
//  Read Files
//
//  Created by Sasori on 13/7/2567 BE.
//

import Foundation

struct Student: Codable {
    let name: String
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case age = "age"
    }
}

struct StudentsList: Codable {
    let students: [Student]
    
    enum CodingKeys: String, CodingKey {
        case students = "Students"
    }
}
