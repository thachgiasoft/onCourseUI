//
//  Course.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 2/26/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation


struct testCourse: Identifiable {
    var id  = UUID()


    var name: String
    var code: String
    var location: String
    var credits: Int


}

let testCourses: [testCourse] = [

testCourse(name: "Biology I", code: "BIO 1000", location: "Old Main", credits: 4),
testCourse(name: "Intro to SE", code: "CSE 3724", location: "Butler 100", credits: 3),
testCourse(name: "Economics I", code: "ECO 1000", location: "McCain", credits: 3),
testCourse(name: "Horseback Riding", code: "Rid 2123", location: "Outside", credits: 3),

]
