//
//  ManagementView.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

import SwiftUI

struct ManagementView: View {
    @StateObject var managementVM = ManagementViewModel()
    var body: some View {
        VStack() {
            Spacer()
            VStack(alignment: .leading) {
                Text("일한시간")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Text(managementVM.workTime)
                    .font(.system(size: 40))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.black)
            }
            .padding(.bottom, 10)
            
            VStack(alignment: .leading) {
                Text("남은 시간")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Text(managementVM.timeRemaining)
                    .font(.system(size: 70))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            
            StatusView(status: $managementVM.status)
            Spacer()
            HStack(spacing: 5) {
                Button {
                    managementVM.goWork()
                } label: {
                    Text("출근")
                        .font(.system(size: 25))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 50)
                        .background(Color.main)
                        .cornerRadius(5)
                }
                
                Button {
                    managementVM.outWork()
                } label: {
                    Text("퇴근")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 50)
                        .background(Color.main)
                        .cornerRadius(5)
                }
            }
            .padding(.bottom, 36)
        }
        .onAppear {
            managementVM.getMyStatus()
        }
    }
}

struct ManagementView_Previews: PreviewProvider {
    static var previews: some View {
        ManagementView()
    }
}
