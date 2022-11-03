//
//  ManagementViewModel.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

/*
 {
   "startTime": "17:30:10",
   "workTime": "18:00:10",
   "timeRemaining": "08:00:00",
   "status": "근무중"
 }
 */

import Foundation
import CoreLocation
import Moya

class ManagementViewModel: ObservableObject {
    let userClient = MoyaProvider<UserService>(plugins: [MoyaLoggerPlugin()])
    
    @Published var startTime: String = "-:-:-"
    @Published var workTime: String = "-:-:-"
    @Published var timeRemaining: String = "-:-:-"
    @Published var status: String = ""
    @Published var latitude: String = "0"
    @Published var longitude: String = "0"
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    
    func getMyStatus() {
        userClient.request(.getMyStatus) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 200:
                    DispatchQueue.main.async {
                        let decoder = JSONDecoder()
                        if let data = try? decoder.decode(ManagementModel.self, from: result.data) {
                            self.startTime = data.startTime
                            self.workTime = data.workTime
                            self.timeRemaining = data.remainingTime
                            self.status = data.status
                            print("✅상태 가져옴")
                        } else {
                            print("⚠️getStatus docoder error")
                        }
                    }
                default:
                    if let errData = try? JSONDecoder().decode(ErrorModel.self, from: result.data) {
                        self.isError = true
                        self.errorMessage = errData.errorMessage
                    } else {
                        print("⚠️getStatus error docoder error")
                    }
                }
            case .failure(let err):
                print("⛔️getStatus error: \(err.localizedDescription)")
            }
        }
    }
    
    func goWork() {
        userClient.request(.startWork(latitude: latitude, longitude: longitude)) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 200:
                    self.getMyStatus()
                    print("🔥출근함")
                default:
                    if let errData = try? JSONDecoder().decode(ErrorModel.self, from: result.data) {
                        self.isError = true
                        self.errorMessage = errData.errorMessage
                    } else {
                        print("⚠️goWork error docoder error")
                    }
                }
            case .failure(let err):
                print("⛔️goWork error: \(err.localizedDescription)")
            }
        }
    }
    
    func outWork() {
        userClient.request(.outOfWork) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 200:
                    DispatchQueue.main.async {
                        self.getMyStatus()
                        print("✅퇴근함")
                    }
                default:
                    print("⚠️outWork error")
                }
            case .failure(let err):
                print("⛔️outWork error: \(err.localizedDescription)")
            }
        }
    }
    
}
