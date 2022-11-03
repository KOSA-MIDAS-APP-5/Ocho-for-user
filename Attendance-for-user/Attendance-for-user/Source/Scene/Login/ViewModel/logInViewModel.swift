import Foundation
import Moya

class LogInViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var isSucced: Int?
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    
    let userClient = MoyaProvider<UserService>(plugins: [MoyaLoggerPlugin()])
    
    func login() {
        userClient.request(.logIn(name: name, password: password)) { res in
            switch res {
            case .success(let result):
                print(result)
                switch result.statusCode {
                case 200:
                    DispatchQueue.main.async {
                        let decoder = JSONDecoder()
                        if let data = try? decoder.decode(LoginModel.self, from: result.data) {
                            Token.accessToken = data.accessToken
                            self.isSucced = 1
                            print("✅로그인 성공")
                        } else {
                            print("⚠️login docoder error")
                        }
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
