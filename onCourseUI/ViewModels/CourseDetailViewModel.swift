//
//  CourseDetailViewModel.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 3/28/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import SwiftUI


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
        
        if let t = course.time {
            return DateFormatter().string(from: t)
        } else {
            print("Error displaying Time in CourseDetailViewModel. Displaying Current Date to prevent crash.")
            return DateFormatter().string(from: Date())
        }
        
    }
    
    @Published var showDeleteAlert: Bool = false
    func toggleShowDeleteAlert() {
        self.showDeleteAlert.toggle()
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
    
    func removeCourse() {
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            moc.delete(self.course)
            try moc.save()
        } catch {
            print("Could not delete")
        }
    }
    
    
    
    
}
