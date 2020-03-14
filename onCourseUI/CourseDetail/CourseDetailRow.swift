//
//  CourseDetailRow.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 2/26/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

struct CourseDetailRow: View {
    
    var DetailType: String
    var value: String
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("\(DetailType):")
                    .font(.system(
                        size: 25,
                        weight: .semibold,
                    design: .default))
                
                Spacer()
            }
            
            
            HStack {
                Text(value)
                    .font(.callout)
                Spacer()
            }
            
            
        }
        
        
        
    }
}

//struct CourseDetailRow_Previews: PreviewProvider {
//    static var previews: some View {
//        let courses: []
//
//        Group {
//         CourseDetailRow(
//            DetailType: "Name",
//            value: courses[0].code)
//
//            CourseDetailRow(
//            DetailType: "Location",
//            value: courses[0].location)
//
//        }.previewLayout(.sizeThatFits)
//
//    }
//}
