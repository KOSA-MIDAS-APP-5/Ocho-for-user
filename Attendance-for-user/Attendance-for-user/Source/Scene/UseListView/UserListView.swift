//
//  UserListView.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

import SwiftUI

struct UserListView: View {
    @StateObject var userListVM = UserListViewModel()
    var body: some View {
        VStack {
            if !userListVM.onlineUserData.isEmpty {
                HStack {
                    Text("현재 출근중")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    Spacer()
                }
                
                ForEach(userListVM.onlineUserData, id: \.self) { data in
                    VStack(alignment: .leading) {
                        Text(data.name)
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text(data.status)
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 12)
                    .shadow(color: .gray, radius: 3, x: 2, y: 2)
                    .padding(.bottom, 10)
                }
            }
            
            if !userListVM.offlineUserData.isEmpty {
                HStack {
                    Text("오프라인")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    Spacer()
                }
                
                ForEach(userListVM.offlineUserData, id: \.self) { data in
                    VStack(alignment: .leading) {
                        Text(data.name)
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text(data.status)
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 12)
                    .shadow(color: .gray, radius: 3, x: 2, y: 2)
                    .padding(.bottom, 10)
                }
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .onAppear {
            userListVM.getOnlineUser()
            userListVM.getOfflineUser()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
