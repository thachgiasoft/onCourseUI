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
    @Environment(\.presentationMode) var presentationMode
    @State var showDeleteAlert: Bool = false
    
    var body: some View {
        // TODO: Handle Forced Unwraps
        
        
        
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
            .alert(isPresented: $showDeleteAlert) {
                
                Alert(title: Text("Are You Sure You Want to Remove \(self.viewModel.name)?"),
                      message: Text("You will not be able to undo this action."),
                      primaryButton: .cancel(),
                      secondaryButton: .destructive(Text("Delete"), action: {
                        self.viewModel.removeCourse()
                        self.presentationMode.wrappedValue.dismiss()
                      }))
            }
            
            
            Button(action: {
                self.showDeleteAlert.toggle()
            }) {
                Text("Remove this Course")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .offset(x: 0, y: -20)
        }
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
