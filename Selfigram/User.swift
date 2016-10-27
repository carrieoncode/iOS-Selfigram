//
//  User.swift
//  Selfigram
//
//  Created by Sam Meech-Ward on 2016-10-26.
//  Copyright © 2016 Sam Meech-Ward. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    let username: String
    let profileImage: UIImage
    
    init(username:String, profileImage:UIImage){
        //we are setting the User property of "username" to an aUsername property you are going to pass in
        self.username = username
        self.profileImage = profileImage
    }
}
