//
//  ProfileViewController.swift
//  MySelfiegram
//
//  Created by Daniel Mathews on 2015-10-16.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBAction func cameraButtonPressed(sender: AnyObject) {
        
        // 1: Create an ImagePickerController
        let pickerController = UIImagePickerController()
        
        // 2: Self in this line refers to this View Controller
        //    Setting the Delegate Property means you want to receive a message
        //    from pickerController when a specific event is triggered.
        pickerController.delegate = self
        
        if TARGET_OS_SIMULATOR == 1 {
            // 3. We check if we are running on a Simulator
            //    If so, we pick a photo from the simulators Photo Library
            pickerController.sourceType = .PhotoLibrary
        } else {
            // 4. We check if we are running on am iPhone or iPad (ie: not a simulator)
            //    If so, we open up the pickerController's Camera (Front Camera)
            pickerController.sourceType = .Camera
            pickerController.cameraDevice = .Front
            pickerController.cameraCaptureMode = .Photo
        }
        
        // Preset the pickerController on screen
        self.presentViewController(pickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // 1. When the delegate method is returned, it passes along a dictionary called info.
        //    This dictionary contains multiple things that maybe useful to us.
        //    We are getting a the URL where the image is save from 
        //     the UIImagePickerControllerReferenceURL key in that dictionary
        if let imageURL = info[UIImagePickerControllerReferenceURL] as? NSURL {
            
            //2. To our imageView, we set the image property to be the image the user has chosen
            
            let imageData = NSData(contentsOfURL: imageURL)!
            
            // set our profileImageView to be the image we have picked
            let image = UIImage(data: imageData)
            profileImageView.image = image
            
            // upload our file to Parse
            let imageFile = PFFile(data: imageData)
            imageFile?.saveInBackgroundWithBlock({ (success, error) -> Void in
                if success {
                    print("image successfully uploaded to Parse")
                }
            })
        }
        
        //3. We remember to dismiss the Image Picker from our screen.
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let user = PFUser.currentUser(){
            usernameLabel.text = user.username
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
