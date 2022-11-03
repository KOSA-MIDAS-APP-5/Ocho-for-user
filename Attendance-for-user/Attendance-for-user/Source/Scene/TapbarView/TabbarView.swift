//
//  TabbarView.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

import SwiftUI

struct TabbarView: View {
    init() {
      UITabBar.appearance().scrollEdgeAppearance = .init()
    }
    
    var body: some View {
        TabView {
            ManagementView()
                .tabItem {
                    Image(systemName: "person.badge.clock.fill")
                    Text("출퇴근")
                }
            
            UserListView()
                .tabItem {
                    Image(systemName: "list.dash.header.rectangle")
                    Text("직원 리스트")
                }
        }
        .font(.headline)
        .accentColor(Color("FFA5A5"))
        .navigationBarBackButtonHidden(true)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
