//
//  SignUpView.swift
//  Attendance-for-user
//
//  Created by 조병진 on 2022/11/03.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var signUpVM = SignUpViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 19) {
                Spacer()
                    .frame(height: 150)
                    
                Text("회원가입")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                AuthTextField(
                    placeholder: "이름",
                    text: $signUpVM.name
                )
                
                AuthTextField(
                    placeholder: "비밀번호",
                    isSecret: true,
                    text: $signUpVM.password
                )
                
                AuthButton(
                    title: "SignUp",
                    action: {
                        signUpVM.signUp()
                    }
                )
                .padding(.top, 15)
                .alert("안내", isPresented: $signUpVM.isError) {
                    Button("확인", role: .cancel) { }
                } message: {
                    Text(signUpVM.errorMessage)
                }
                .alert("안내", isPresented: $signUpVM.showAlert) {
                    Button("확인", role: .cancel) { }
                } message: {
                    Text("회원가입이 완료되었습니다.")
                }
                Spacer()
            }
            .padding(.horizontal, 23)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
