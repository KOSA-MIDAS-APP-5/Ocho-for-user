//
//  SignUpViewModel.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

import Foundation
import Moya

class SignUpViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var isSucced: Int?
    @Published var showAlert: Bool = false
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    
    let userClient = MoyaProvider<UserService>(plugins: [MoyaLoggerPlugin()])
    
    func signUp() {
        userClient.request(.signUp(name: name, password: password)) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 200:
                    DispatchQueue.main.async {
                        print("✅회원가입 성공")
                        self.showAlert = true
                    }
                default:
                    if let errData = try? JSONDecoder().decode(ErrorModel.self, from: result.data) {
                        self.isError = true
                        self.errorMessage = errData.errorMessage
                    } else {
                        print("⚠️login error docoder error")
                    }
                }
            case .failure(let err):
                print("⛔️login error: \(err.localizedDescription)")
            }
        }
    }
}
