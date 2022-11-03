import Foundation
import Moya

enum UserService {
    case logIn(name: String, password: String)
    case signUp(name: String, password: String)
    case startWork
    case getMyStatus
    case outOfWork
    case onlineUsers
    case offlineUsers
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
        case .startWork:
            return "/attendance/new"
        case .getMyStatus:
            return "/attendance"
        case .outOfWork:
            return "/attendance/edit"
        case .onlineUsers:
            return "/attendance/go-work"
        case .offlineUsers:
            return "/attendance/not/go-work"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .logIn, .signUp, .startWork:
            return .post
        case .getMyStatus, .onlineUsers, .offlineUsers:
            return .get
        case .outOfWork:
            return .put
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
        case .startWork, .getMyStatus, .outOfWork, .onlineUsers, .offlineUsers:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .logIn, .signUp:
            return Header.tokenIsEmpty.header()
        case .startWork, .getMyStatus, .outOfWork, .onlineUsers, .offlineUsers:
            return Header.accessToken.header()
        }
    }
}
