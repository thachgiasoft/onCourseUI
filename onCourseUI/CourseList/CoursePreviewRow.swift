//
//  CoursePreviewRow.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 2/26/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

struct CoursePreviewRow: View {
    var course: Course
    
    var body: some View {
        VStack {
            
            HStack {
                Text(course.name)
                    .font(Font.system(size: 20, weight: .semibold, design: .default))
//                    .padding(.bottom)
                Spacer()
            }
            
            HStack {
                Text(course.code)
                Spacer()
                Text("Credits: \(String(course.credits))")
            }
            
            
        }
    }
}

struct CoursePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            CoursePreviewRow(course: courses[0])
            CoursePreviewRow(course: courses[1])
        }.previewLayout(.sizeThatFits)
        
    }
}
