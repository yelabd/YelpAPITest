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

class ViewController: UIViewController {

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
        getToken()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getToken(){
        Alamofire.request(baseURL,method: .post,parameters: ["grant_type" : "client_credentials","client_id" : clientID,"client_secret" : secret],encoding: URLEncoding.default,headers : nil).responseJSON{ response in
            
            if response.result.isSuccess {
                guard let info = response.result.value else {
                    print("Error")
                    return
                }
                print(info)
                let json = JSON(info)
                print(json)
                
                self.token = json["access_token"].stringValue
                self.loadBusiness()
            }

        }
    }

    func loadBusiness(){
        Alamofire.request(searchURL,method : .get, parameters: ["location" : location],encoding: URLEncoding.default,headers: ["Authorization" : "Bearer \(token!)"]).validate().responseJSON{response in
            
            if response.result.isSuccess {
                guard let info = response.result.value else {
                    print("Error")
                    return
                }
                //print(info)
                let json = JSON(info)
                //print(json)
                
                let businesses = json["businesses"].arrayValue
                
                let business = businesses[0]
                
                self.nameLabel.text = business["name"].stringValue
                self.addressLabel.text = business["phone"].stringValue
                self.priceLabel.text = business["price"].stringValue
                
                let locationD = business["location"]
                
                self.addressLabel.text = locationD["city"].stringValue
                
                
                
                
                print(business)
                
                //self.token = json["access_token"].stringValue
            }
            
        }

    }

}

