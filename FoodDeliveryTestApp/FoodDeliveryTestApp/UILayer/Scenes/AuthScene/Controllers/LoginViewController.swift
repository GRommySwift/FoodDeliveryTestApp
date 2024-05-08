//
//  LoginViewController.swift
//  FoodDeliveryTestApp
//
//  Created by Roman on 02/05/2024.
//

import UIKit

enum LoginViewState {
    case initial
    case signIn
    case signUp
}

protocol LoginViewInput: AnyObject {
    func onSignInTapped()
    func onSignUpTapped()
    func onFacebookTapped()
    func onGoogleTapped()
    func onForgotTapped()
    func onBackPressed()
}

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    private var state: LoginViewState = .initial
    var viewOutput: LoginViewOutput!
    
    //MARK: - Views
    private lazy var bottomView = FDBottomView()
    private lazy var titlelabel = UILabel()
    private lazy var signInUsername = FDTextField()
    private lazy var signInPassword = FDTextField()
    private lazy var signUpUsername = FDTextField()
    private lazy var signUpPassword = FDTextField()
    private lazy var signUpReEnterPas = FDTextField()
    private lazy var forgotlabel = UILabel()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    private lazy var verticalStack = UIStackView()
    
    
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    //MARK: - Initializers
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    func facebookPress() {
        print("facebook")
    }
    
    func googlePress() {
        print("google")
    }
}
// MARK: - Layout
private extension LoginViewController {
    
    func setupLayout() {
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .signIn:
            setupBottomView()
            setupStack()
            setupSignInPassword()
            setupSignInUsername()
            setupTitleLAbel()
            setupSignInButton()
            setupForgotLabel()
        case .signUp:
            setupBottomView()
            setupStack()
            setupSignUpUsername()
            setupSignUpPass()
            setupSignUpReEnterPassword()
            setupTitleLAbel()
            setupSignInButton()
            setupForgotLabel()
        }
        
    }
    
    func setupStack() {
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 20
        
        switch state {
        case .initial:
            return
        case .signIn:
            verticalStack.addArrangedSubview(signInUsername)
            verticalStack.addArrangedSubview(signInPassword)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -262)
            ])
        case .signUp:
            verticalStack.addArrangedSubview(signUpUsername)
            verticalStack.addArrangedSubview(signUpReEnterPas)
            verticalStack.addArrangedSubview(signUpPassword)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -227)
            ])
        }
        
      
    }
    
    //MARK: - SETUP BOTTOM VIEW
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.button2Action = facebookPress
        bottomView.button1Action = googlePress
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    //MARK: - SETUP LOGIN VIEW
    func setupSignInPassword() {

        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        signInPassword.placeholder = "Password"
        
        NSLayoutConstraint.activate([
            signInPassword.heightAnchor.constraint(equalToConstant: 50),
            signInPassword.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signInPassword.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30)
        ])
    }
    
    
    func setupSignInUsername() {
        signInUsername.translatesAutoresizingMaskIntoConstraints = false
        signInUsername.placeholder = "User name"
        
        NSLayoutConstraint.activate([
            signInUsername.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signInUsername.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signInUsername.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupTitleLAbel() {
        
        view.addSubview(titlelabel)
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        titlelabel.font = .Roboto.bold.size(of: 24)
        
        switch state {
        case .signIn:
            titlelabel.text = "Sign in"
        case .signUp:
            titlelabel.text = "Sign Up"
        case .initial:
            print(" ")
        }
        NSLayoutConstraint.activate([
            titlelabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
            titlelabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            titlelabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            titlelabel.heightAnchor.constraint(equalToConstant: 50),
        ])
       
    }
    
    //MARK: - SETUP REGISTRATION VIEW
    
    func setupSignUpPass() {
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpPassword.placeholder = "Enter Password"
        
        NSLayoutConstraint.activate([
            signUpPassword.heightAnchor.constraint(equalToConstant: 50),
            signUpPassword.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpPassword.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30)
        ])
    }
    func setupSignUpUsername() {

        signUpUsername.translatesAutoresizingMaskIntoConstraints = false
        signUpUsername.placeholder = "Enter User Name"
        
        NSLayoutConstraint.activate([
            signUpUsername.heightAnchor.constraint(equalToConstant: 50),
            signUpUsername.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpUsername.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30)
        ])
        
    }
    func setupSignUpReEnterPassword() {
        signUpReEnterPas.translatesAutoresizingMaskIntoConstraints = false
        signUpReEnterPas.placeholder = "Re-Enter Password"
        
        NSLayoutConstraint.activate([
            signUpReEnterPas.heightAnchor.constraint(equalToConstant: 50),
            signUpReEnterPas.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpReEnterPas.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30)
        ])
    }
    
    
    
    
    //MARK: - SETUP INITIAL PAGE
    func setupLogoImage() {
        view.addSubview(logoImage)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "appstore")
        logoImage.layer.masksToBounds = true
        logoImage.layer.cornerRadius = 30
        
        NSLayoutConstraint.activate([
            
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 109),
            logoImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 57),
            logoImage.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor)
            
        ])
    }
    
    func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign in")
        signInButton.scheme = .orange
        signInButton.action = onSignInTapped
        switch state {
        case .initial:
            
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signIn:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signUp:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
    }
    
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up")
        signUpButton.scheme = .gray
        signUpButton.action = onSignUpTapped
        NSLayoutConstraint.activate([
            
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func setupForgotLabel() {
        view.addSubview(forgotlabel)
        forgotlabel.translatesAutoresizingMaskIntoConstraints = false
        forgotlabel.text = "Forgot Password?"
        forgotlabel.font = .Roboto.regular.size(of: 14)
        forgotlabel.textColor = AppColors.bottomViewGray
        NSLayoutConstraint.activate([
            
            forgotlabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            forgotlabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
        ])
        
    }
}

// MARK: - LoginView input delegate
extension LoginViewController: LoginViewInput {
    
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignIn()
        case .signIn:
            return
        case .signUp:
            return
        }
    }
    
    func onSignUpTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignUp()
        case .signIn:
            return
        case .signUp:
            return
        }
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    
}
