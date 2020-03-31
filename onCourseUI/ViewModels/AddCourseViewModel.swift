//
//  AddCourseViewModel.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 3/30/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class AddCourseViewModel: ObservableObject {
    
    @Published public var name: String = ""
    @Published public var code: String = ""
    @Published public var section: String = ""
    @Published  public var credits: String = ""
    @Published public var location: String = ""
    @Published public var time: String = ""
    
    enum Titles: String {
        case name = "Name"
        case code = "Code"
        case section = "Sec."
        case credits = "Credits Hours"
        case location = "Location"
        case time = "Times"
    }
    
    enum Placeholders: String {
        case name = "ex. Biology I"
        case code = "ex. BIO 1000"
        case section = "02"
        case credits = "ex. 3"
        case location = "ex. Davis Hall 232"
        case time = "ex. M W F 9:00am-8:00am"
    }
    
    public func addCourseToCD() {
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let course = Course(context: moc)
        
        course.name = self.name
        course.code = self.code
        
        if let section = Int(self.section) {
            course.section = NSNumber(integerLiteral: section)
        }

        if let credits = Int(self.credits) {
            course.credits = NSNumber(integerLiteral: credits)
        }

        course.location = self.location
        course.time = self.time
        
        do {
            try moc.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
