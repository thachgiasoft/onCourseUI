//
//  CourseDetailView.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 2/26/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI
import CoreData


class CourseDetailViewModel: ObservableObject {
    
    @Published public var detailTitle: DetailType!
    
    @Published var name: String!
    @Published var code: String!
    @Published var credits: String!
    @Published var location: String!
    @Published var time: String!
    
    
    enum DetailType: String {
        case Name = "Name"
        case Code = "Code"
        case Credits = "Credit Hours"
        case Location = "Location"
        case Time = "Time"
    }
    
    init(course: Course) {
        self.name = course.name
        self.code = course.code
        
        if let credits = course.credits {
            self.credits = String(Int(truncating:credits))
        } else {
            self.credits = "N/A"
        }
        
        self.location = course.location
        self.time = course.time
        
    }
}



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
                    value: viewModel.credits)
                
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
