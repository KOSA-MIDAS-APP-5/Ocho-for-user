//
//  TabbarView.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            ManagementView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("h")
                }
            
            UserListView()
                .tabItem {
                    Image(systemName: "book")
                    Text("list")
                }
        }
        .font(.headline)
        .navigationBarBackButtonHidden(true)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
