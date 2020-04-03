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
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: CourseDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.editMode) var editable
    @EnvironmentObject var courseListViewModel: CourseListViewModel // Needed to fetch courses.
    typealias detailType = CourseDetailViewModel.DetailType
    
    
    // MARK: - Buttons
    var RemoveButton: some View {
        Button(action: {
            self.viewModel.toggleShowDeleteAlert()
        }) {
            Text("Remove this Course")
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .center) {
            
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
                
                CourseDetailRow(
                    DetailType: detailType.Time.rawValue,
                    value: viewModel.time)
                
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .alert(isPresented: $viewModel.showDeleteAlert) {
                
                Alert(title: Text("Are You Sure You Want to Remove \(self.viewModel.name)?"),
                      message: Text("You will not be able to undo this action."),
                      primaryButton: .cancel(),
                      secondaryButton: .destructive(Text("Delete"), action: {
                        self.viewModel.removeCourse()
                        self.courseListViewModel.fetchCourses()
                        self.presentationMode.wrappedValue.dismiss()
                      }))
            }
            RemoveButton
                .offset(x: 0, y: -20)
            
        }
        .navigationBarTitle(Text(viewModel.name))
        .navigationBarItems(trailing: EditButton())
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
