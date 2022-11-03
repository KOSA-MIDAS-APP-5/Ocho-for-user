//
//  ManagementModel.swift
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

struct ManagementModel: Codable {
    let startTime: String
    let workTime: String
    let remainingTime: String
    let status: String
}
