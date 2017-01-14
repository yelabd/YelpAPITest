//
//  ViewController.swift
//  Yelp API Test
//
//  Created by Youssef Elabd on 1/11/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AFNetworking

class ViewController: UIViewController {
    
    var business : Business?
    

    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var token : String?
    let clientID = "brKTMeHemIXkaxGaFLVKnQ"
    let secret = "NIbKBlSyf5oFuGrjMW0ORnkG0rKAIBFnjOWkbm6Z9A0sKNQmC2g0KccVU0P3EpGs"
    let baseURL = "https://api.yelp.com/oauth2/token"
    let searchURL = "https://api.yelp.com/v3/businesses/search"
    let location = "West Lafayette, IN"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let businessInfo = business else{
            return
        }
        
        nameLabel.text = businessInfo.name
        phoneLabel.text = businessInfo.phoneNumber
        priceLabel.text = businessInfo.price
        addressLabel.text = businessInfo.location
        
        let imageURL = URL(string: businessInfo.imageURL)
        
        pictureView.setImageWith(imageURL!)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}

