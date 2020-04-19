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
    /// This is the time that the class starts
    var time: String {
        guard let startTime = course.start_time else {
            return "N/A"
        }
        guard let endTime = course.end_time else {
            return "N/A"
        }
        
        let formatter = DateFormatter()
        let start = formatter.string(from: startTime)
        let end = formatter.string(from: endTime)
        return "\(start) to \(end)"
        
        
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
