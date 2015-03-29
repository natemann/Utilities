//
//  Validator.swift
//  Budget
//
//  Created by Nate on 9/18/14.
//  Copyright (c) 2014 Nate. All rights reserved.
//

import Foundation

struct Validator {
    
    typealias ValidString = String? -> Bool
    
    private static func validate(regex: NSRegularExpression) -> ValidString {
        return { string in
            if let string = string {
                return regex.numberOfMatchesInString(string, options: nil, range: NSMakeRange(0, countElements(string))) == 0 ? false : true
            }
            return false
        }
    }
    
    static func userNameValidator(userName: String?) -> Bool {
        if let userName = userName {
            return self.validate(NSRegularExpression(pattern: "[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", options: .CaseInsensitive, error: nil)!)(userName)
        }
        return false
    }

    static func passwordValidator(password: String?) -> Bool {
        if let password = password {
            return self.validate(NSRegularExpression(pattern: "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\\s).*$", options: nil, error: nil)!)(password)
        }
        return false
    }
    
    static func setPasswordValidator(firstPassword: String?, secondPassword: String?) -> Bool {
        if let firstPassword = firstPassword {
            if let secondPassword = secondPassword {
                if firstPassword == secondPassword {
                    if passwordValidator(firstPassword) == true && passwordValidator(secondPassword) == true {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    static func logInValidator(userName: String, password: String) -> Bool {
        return userNameValidator(userName) == passwordValidator(password)
    }
    
    static func signUpValidator(userName: String?, password: String?, confirmPassword: String?) -> (validUserName: Bool, validPassword: Bool, matchingPasswords: Bool) {        
        return (userNameValidator(userName), passwordValidator(password), setPasswordValidator(password, secondPassword: confirmPassword))
    }

}




