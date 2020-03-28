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
    
    var viewModel: CourseViewModel
    
    var body: some View {
        VStack {
            
            HStack {
                Text(viewModel.name)
                    .font(Font.system(size: 20, weight: .semibold, design: .default))
//                    .padding(.bottom)
                Spacer()
            }
            
            HStack {
                Text(viewModel.code)
                Spacer()
                Text(viewModel.credits)
            }
            
            
        }
    }
}

//struct CoursePreviewRow_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        Group {
//
//        }.previewLayout(.sizeThatFits)
//
//    }
//}
