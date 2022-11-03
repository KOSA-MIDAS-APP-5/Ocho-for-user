import SwiftUI

struct LoginView: View {
    @StateObject var LoginVM = LogInViewModel()
    var body: some View {
        ZStack {
            navi
            VStack(spacing: 19) {
                Spacer()
                    .frame(height: 150)
                    
                Text("출퇴근 관리 시스템")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                AuthTextField(
                    placeholder: "이름",
                    text: $LoginVM.name
                )
                
                AuthTextField(
                    placeholder: "비밀번호",
                    isSecret: true,
                    text: $LoginVM.password
                )
                
                HStack {
                    NavigationLink(destination: SignUpView()) {
                        Text("회원가입")
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    Button {
                        print("비밀번호 찾기")
                    } label: {
                        Text("비밀번호 찾기")
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                    }
                }
                
                AuthButton(
                    title: "Login",
                    action: {
                        LoginVM.login()
                    }
                )
                .padding(.top, 15)
                .alert("안내", isPresented: $LoginVM.isError) {
                    Button("확인", role: .cancel) {}
                } message: {
                    Text(LoginVM.errorMessage)
                }
                Spacer()
            }
            .padding(.horizontal, 23)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
