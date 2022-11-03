//
//  StatusView.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

import SwiftUI

struct StatusView: View {
    var isWork: Bool = false
    var status: String = "출근중"
    var body: some View {
        Circle()
            .foregroundColor(isWork ? Color("30DB5B") : Color("FFA5A5"))
            .overlay(
                Text(status)
                    .font(.system(size: 80))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            )
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}
