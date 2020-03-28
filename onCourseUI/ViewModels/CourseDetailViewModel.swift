//
//  CourseDetailViewModel.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 3/28/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation


class CourseDetailViewModel: ObservableObject {
    var course: Course
    
    var name : String {
        return course.name ?? "N/A"
    }
    
    var code: String {
        return course.code ?? "N/A"
    }
    
    var credits: Int {
        return course.credits?.intValue ?? 0
    }
    var location: String {
        return course.location ?? "N/A"
    }
    var time: String {
        return course.time ?? "N/A"
    }
    
    enum DetailType: String {
        case Name = "Name"
        case Code = "Code"
        case Credits = "Credit Hours"
        case Location = "Location"
        case Time = "Time"
    }
    
    init(course: Course) {
        self.course = course
    }
    
    
    
    
}
