//
//  Activity.swift
//  MySelfiegram
//
//  Created by Daniel Mathews on 2015-12-12.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

import Parse

class Activity:PFObject, PFSubclassing {
    
    
    @NSManaged var type:String
    @NSManaged var post:Post
    @NSManaged var user:PFUser
    
    override class func initialize() {
        OperationQueue.init().addOperation {
            self.registerSubclass()
        }
    }
    
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
