//
//  UserListViewModel.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

import Foundation
import Moya

class UserListViewModel: ObservableObject {
    @Published var onlineUserData: [ListFormatModel] = []
    @Published var offlineUserData: [ListFormatModel] = []
    let userClient = MoyaProvider<UserService>(plugins: [MoyaLoggerPlugin()])
    
    func getOnlineUser() {
        userClient.request(.onlineUsers) { res in
            switch res {
            case .success(let result):
                print(result)
                switch result.statusCode {
                case 200:
                    DispatchQueue.main.async {
                        let decoder = JSONDecoder()
                        if let data = try? decoder.decode(UserListModel.self, from: result.data) {
                            self.onlineUserData = data.map {
                                let name = $0.name
                                let status = $0.status
                                
                                return ListFormatModel(name: name, status: status)
                            }
                            print("\(self.onlineUserData)")
                            print("✅온라인 유져 조회")
                        } else {
                            print("⚠️온라인 유져 조회 docoder error")
                        }
                    }
                default:
                    print("⚠️온라인 유져 조회 error")
                }
            case .failure(let err):
                print("⛔️온라인 유져 조회 error: \(err.localizedDescription)")
            }
        }
    }
    
    func getOfflineUser() {
        userClient.request(.offlineUsers) { res in
            switch res {
            case .success(let result):
                print(result)
                switch result.statusCode {
                case 200:
                    DispatchQueue.main.async {
                        let decoder = JSONDecoder()
                        if let data = try? decoder.decode(UserListModel.self, from: result.data) {
                            self.offlineUserData = data.map {
                                let name = $0.name
                                let status = $0.status
                                
                                return ListFormatModel(name: name, status: status)
                            }
                            print("\(self.offlineUserData)")
                            print("✅오프라인 유져 조회")
                        } else {
                            print("⚠️오프라인 유져 조회 docoder error")
                        }
                    }
                default:
                    print("⚠️오프라인 유져 조회 error")
                }
            case .failure(let err):
                print("⛔️오프라인 유져 조회 error: \(err.localizedDescription)")
            }
        }
    }
}
