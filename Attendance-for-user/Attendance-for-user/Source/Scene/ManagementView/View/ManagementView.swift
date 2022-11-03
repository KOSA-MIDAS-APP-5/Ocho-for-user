//
//  ManagementView.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

import SwiftUI

struct ManagementView: View {
    let locationService = LocationService()
    @StateObject var managementVM = ManagementViewModel()
    @State private var goWorkAlert: Bool = false
    @State private var outWorkAlert: Bool = false
    var body: some View {
        VStack() {
            Spacer()
            VStack(alignment: .leading) {
                Text("일한시간")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Text(managementVM.workTime)
                    .font(.system(size: 40))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.black)
            }
            .padding(.bottom, 10)
            
            VStack(alignment: .leading) {
                Text("남은 시간")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Text(managementVM.timeRemaining)
                    .font(.system(size: 70))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            
            StatusView(status: $managementVM.status)
            Spacer()
            HStack(spacing: 5) {
                Button {
                    self.goWorkAlert = true
                } label: {
                    Text("출근")
                        .font(.system(size: 25))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 50)
                        .background(managementVM.status == "근무중" || managementVM.status == "휴식중" ? Color("DDDDDD") : Color.main)
                        .cornerRadius(5)
                }.disabled(managementVM.status == "근무중" || managementVM.status == "휴식중" ? true : false)
                
                if managementVM.status != "퇴근" {
                    Button {
                        self.outWorkAlert = true
                    } label: {
                        Text("퇴근")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 50)
                            .background(Color.main)
                            .cornerRadius(5)
                    }
                }
            }
            .padding(.bottom, 36)
            .alert("출근", isPresented: $goWorkAlert) {
                Button("취소", role: .cancel) {}
                Button("출근하기", role: .none) {
                    locationService.requestLocation { coordinate in
                        managementVM.latitude = "\(coordinate.latitude)"
                        managementVM.longitude = "\(coordinate.longitude)"
                        managementVM.goWork()
                    }
                }
            } message: {
                Text("지금부터 출근 하시겠습니까?")
            }
            .alert("퇴근", isPresented: $outWorkAlert) {
                Button("취소", role: .cancel) {}
                Button("퇴근하기", role: .none) {
                    managementVM.outWork()
                }
            } message: {
                Text("퇴근 하시겠습니까?")
            }
        }
        .onAppear {
            managementVM.getMyStatus()
        }
        .alert("안내", isPresented: $managementVM.isError) {
            Button("확인", role: .cancel) {}
        } message: {
            Text(managementVM.errorMessage)
        }
    }
}

struct ManagementView_Previews: PreviewProvider {
    static var previews: some View {
        ManagementView()
    }
}
