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

struct CourseDetailRow_Previews: PreviewProvider {
    static var previews: some View {

        Group {
         CourseDetailRow(
            DetailType: "Name",
            value: "TestValue")

            CourseDetailRow(
            DetailType: "Location",
            value: "Test Place")

        }.previewLayout(.sizeThatFits)

    }
}
