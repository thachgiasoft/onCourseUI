//
//  CourseDetailView.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 2/26/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI
import CoreData




struct CourseDetailView: View {
    
    var viewModel: CourseDetailViewModel
    typealias detailType = CourseDetailViewModel.DetailType
    
    var body: some View {
        // TODO: Handle Forced Unwraps
        
            List {
             
                CourseDetailRow(
                    DetailType: detailType.Code.rawValue,
                    value: viewModel.code)
                
                CourseDetailRow(
                    DetailType: detailType.Location.rawValue,
                    value: viewModel.location)
                
                CourseDetailRow(
                    DetailType: detailType.Credits.rawValue,
                    value: "\(viewModel.credits)")
                
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle(viewModel.name)
    }
}

//struct CourseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        let VM = CourseDetailViewModel(course: Course())
//        CourseDetailView(viewModel: VM)
//
//    }
//}
