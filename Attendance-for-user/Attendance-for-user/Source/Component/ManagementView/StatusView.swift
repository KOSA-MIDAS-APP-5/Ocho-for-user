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
            .overlay(
                VStack {
                    Image("check")
                        
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
        StatusView(status: .constant("근무중"))
    }
}
