import Foundation
import Moya

enum UserService {
    case logIn(name: String, password: String)
    case signUp(name: String, password: String)
}

/*
 회원가입 : 192.168.101.27:8091/user/join
 로그인 : 192.168.101.27:8091/user/login
 */
extension UserService: TargetType {
    var baseURL: URL {
        return URL(string: "http://192.168.101.27:8091")!
    }
    
    var path: String {
        switch self {
            
        case .logIn:
            return "/user/login"
        case .signUp:
            return "/user/join"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .logIn, .signUp:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .logIn(let name, let password):
            return .requestParameters(
                parameters:
                    [
                        "name" : name,
                        "password" : password
                    ],
                encoding: JSONEncoding.default
            )
        case .signUp(let name, let password):
            return .requestParameters(
                parameters:
                    [
                        "name" : name,
                        "password" : password
                    ],
                encoding: JSONEncoding.default
            )
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .logIn, .signUp:
            return Header.tokenIsEmpty.header()
        }
    }
}
