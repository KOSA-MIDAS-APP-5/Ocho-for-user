import SwiftUI

struct LoginView: View {
    @StateObject var LoginVM = LogInViewModel()
    var body: some View {
        ZStack {
            NavigationLink(destination: ManagementView(), tag: 1, selection: $LoginVM.isSucced) { EmptyView() }
            VStack(alignment: .leading, spacing: 19) {
                Spacer()
                    .frame(height: 110)
                    
                LoginTitle()
                
                AuthTextField(
                    placeholder: "이름",
                    text: $LoginVM.name
                )
                
                AuthTextField(
                    placeholder: "비밀번호",
                    isSecret: true,
                    text: $LoginVM.password
                )
                
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
                
                HStack {
                    Spacer()
                    HStack(spacing: 0) {
                        Text("계정이 없으신가요?")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .fontWeight(.medium)
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("회원가입")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                                .underline()
                        }
                    }
                    Spacer()
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
