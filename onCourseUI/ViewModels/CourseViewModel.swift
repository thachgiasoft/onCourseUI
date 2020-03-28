//
//  CourseViewModel.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 3/28/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

/// This is the Course Preview ViewModel that passed into each row.
/// Previews the Name, code, and credits of a course.
class CourseViewModel: ObservableObject, Identifiable {
    var course: Course
    
    var name: String {
        return course.name ?? "Name Unavailable"
    }
    
    var code: String {
        return course.code ?? "N/A"
    }
    
    var credits: String {
        return "Credits: \(course.creditsInt)"
    }
    
    
    init(course: Course) {
        self.course = course
    }
    
}
