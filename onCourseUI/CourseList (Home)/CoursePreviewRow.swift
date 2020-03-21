//
//  CoursePreviewRow.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 2/26/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI
import CoreData

struct CoursePreviewRow: View {
    var name:String
    var code: String
    var credits: Int
    
    var body: some View {
        VStack {
            
            HStack {
                Text(name)
                    .font(Font.system(size: 20, weight: .semibold, design: .default))
//                    .padding(.bottom)
                Spacer()
            }
            
            HStack {
                Text(code)
                Spacer()
                Text("Credits: \(String(credits))")
            }
            
            
        }
    }
}

struct CoursePreviewRow_Previews: PreviewProvider {

    static var previews: some View {

        Group {
            CoursePreviewRow(name: "Intro to Biology", code: "BIO 1001", credits: 3)
            CoursePreviewRow(name: "Intermediate Programming", code: "CSE 1001", credits: 3)
        }.previewLayout(.sizeThatFits)

    }
}
