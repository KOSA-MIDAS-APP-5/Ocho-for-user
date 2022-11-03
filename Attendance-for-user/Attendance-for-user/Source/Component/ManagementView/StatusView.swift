//
//  StatusView.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

import SwiftUI

struct StatusView: View {
    @Binding var status: String
    var body: some View {
        Circle()
            .frame(width: 251, height: 251)
            .foregroundColor(status == "근무중" ? Color("FFA5A5") : Color.gray)
            .shadow(color: .gray, radius: 5, x: 1, y: 1)
            .overlay(
                VStack {
                    if status == "근무중" {
                        Image("check")
                    } else if status == "퇴근" {
                        Image("house")
                    } else if status == "휴식중" {
                        Image("rest")
                    }
                        
                    Text(status)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
            )
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(status: .constant("퇴근"))
    }
}
