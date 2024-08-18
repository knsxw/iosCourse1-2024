//
//  AUPlace.swift
//  AU Map
//
//  Created by Sasori on 17/8/2567 BE.
//

import Foundation

class AUPlace {
    var facultyName: String
    var abbreviation: String
    var imageLogoName: String
    var latitude: Double
    var longitude: Double
    
    init(facultyName: String, abbreviation: String, imageLogoName: String, latitude: Double, longitude: Double) {
        self.facultyName = facultyName
        self.abbreviation = abbreviation
        self.imageLogoName = imageLogoName
        self.latitude = latitude
        self.longitude = longitude
    }
}
