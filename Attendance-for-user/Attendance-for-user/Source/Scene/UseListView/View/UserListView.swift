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
            ScrollView {
                if !userListVM.onlineUserData.isEmpty {
                    HStack {
                        Text("현재 출근중")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    ForEach(userListVM.onlineUserData, id: \.self) { data in
                        HStack(alignment: .center) {
                            Image(systemName: "bag.fill.badge.plus")
                                .font(.system(size: 23))
                            VStack(alignment: .leading) {
                                Rectangle()
                                    .frame(height: 0)
                                
                                Text(data.name)
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Text(data.status)
                                    .font(.system(size: 12))
                                    .fontWeight(.medium)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.leading, 12)
                        .padding(.bottom, 8)
                        .background(Color("DDDDDD"))
                        .cornerRadius(5)
                        
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
                        HStack(alignment: .center) {
                            Image(systemName: data.status == "휴식중" ? "takeoutbag.and.cup.and.straw.fill" : "bag.fill.badge.minus")
                                .font(.system(size: 23))
                            VStack(alignment: .leading) {
                                Rectangle()
                                    .frame(height: 0)
                                
                                Text(data.name)
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Text(data.status)
                                    .font(.system(size: 12))
                                    .fontWeight(.medium)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.leading, 12)
                        .padding(.bottom, 8)
                        .background(Color("DDDDDD"))
                        .cornerRadius(5)
                    }
                }
                Spacer()
            }
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
