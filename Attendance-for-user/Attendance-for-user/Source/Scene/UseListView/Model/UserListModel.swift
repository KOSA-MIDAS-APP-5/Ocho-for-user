//
//  UserListModel.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

import Foundation

struct UserListElement: Codable {
    let name, status: String
}

typealias UserListModel = [UserListElement]

struct ListFormatModel: Hashable {
    var name: String = .init()
    var status: String = .init()
}
