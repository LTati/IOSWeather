//
//  detailVC.swift
//  IOSWeather
//
//  Created by user on 22/11/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class detailVC: UIViewController {

    var cityName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let colorTop = UIColor(red: 89/255, green: 156/255, blue: 169/255, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        self.view.layer.addSublayer(gradientLayer)
    }
    
    func currentWeather(city: String){
        let url = "https://api.weatherapi.com/v1/current.json?key=5526179d4b6e4b1da3953611222211&q=\(city)"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let name = json["location"]["name"].stringValue
                let temp = json["current"]["temp_c"].doubleValue
                //let country = json["location"]["country"].stringValue
                //let weatherURLString = "http:\(json["location"][0]["icon"].stringValue)"
                
                
                print(value)
            case .failure(let error):
                print("error")
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
