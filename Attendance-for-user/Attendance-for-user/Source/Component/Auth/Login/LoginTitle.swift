//
//  LoginTitle.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

import SwiftUI

struct LoginTitle: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack(alignment: .bottom, spacing: 0) {
                Text("5초")
                    .font(.system(size: 32))
                    .fontWeight(.heavy)
                    .foregroundColor(.main)
                    .padding(.bottom, 10)
                
                Text("안에")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
            }
            Text("퇴근하세요")
                .font(.system(size: 32))
                .fontWeight(.bold)
                .padding(.bottom, 10)
        }
    }
}

struct LoginTitle_Previews: PreviewProvider {
    static var previews: some View {
        LoginTitle()
    }
}
