//
//  AuthButton.swift
//  Attendance
//
//  Created by 조병진 on 2022/11/03.
//

import SwiftUI

struct AuthButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            VStack(spacing: 0) {
                Rectangle()
                    .frame(height: 0)
                Text(title)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 19)
            .background(Color("92A9BD"))
            .cornerRadius(8)
            .shadow(color: .gray, radius: 2, x: 1, y: 1)
        }
    }
}

struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(title: "Login", action: { })
    }
}
