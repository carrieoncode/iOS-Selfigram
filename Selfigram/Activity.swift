//
//  Activity.swift
//  Selfigram
//
//  Created by Sam Meech-Ward on 2016-11-02.
//  Copyright © 2016 Sam Meech-Ward. All rights reserved.
//


import Foundation
import Parse

class Activity:PFObject, PFSubclassing {
    
    @NSManaged var type:String
    @NSManaged var post:Post
    @NSManaged var user:PFUser
    
    static func parseClassName() -> String {
        return "Activity"
    }
    
    convenience init(type:String, post:Post, user:PFUser){
        self.init()
        self.type = type
        self.post = post
        self.user = user
    }
    
}
