//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    
    func userEnteredNewCityName(city: String) {
        let params : [String: String] = ["q" : city, "appId" : APP_ID]
        getWeatherData(url: WEATHER_URL, parameters: params)
    }
    
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "d4ae4049b119f6c9d71b83e26dc8d993"
    /***Get your own App ID at https://openweathermap.org/appid ****/
    

    //TODO: Declare instance variables here
    
    let locationManager = CLLocationManager();
    let weatherDataModel = WeatherDataModel();
    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    @IBOutlet weak var tempUnit: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO:Set up the location manager here.
        // we are setting the weatherViewController as the delegate of the location manager. so that location manager can help us.
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation() // async method does not run on current thread
        tempUnit.setOn(false, animated: false)
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    
    func getWeatherData(url: String, parameters: [String: String]) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success!! Got the weather data")
                let weatherJSON:  JSON = JSON(response.result.value!)
                self.updateWeatherData(json: weatherJSON)
                
            } else {
                print("Error : \(response.result.error!)")
                self.cityLabel.text = "Connection issues"
            }
        }
    }
    
    
    
    
    func getWeather(_ tempResults: Int) -> Int{
        if tempUnit.isOn {
            return Int(1.8 * (Double(tempResults) - 273.15) + 32)
        }
        return Int(tempResults - 273)
    }
    //MARK: - JSON Parsing
    /***************************************************************/
   
    //Write the updateWeatherData method here:
    func updateWeatherData(json : JSON) {
        if let tempResults = json["main"]["temp"].double {
            print("Got Results")
            let res: Int  = Int(tempResults)
            weatherDataModel.kelvinTemperature = res
            weatherDataModel.temprature = getWeather(res);
        weatherDataModel.city = json["name"].stringValue
            print(json["name"].stringValue)
        weatherDataModel.condition = json["weather"][0]["id"].intValue
        weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
        }
        else {
            cityLabel.text="Weather Unavailable"
        }
        updateUIWithWeatherData()
    }

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    func updateUIWithWeatherData() {
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = "\(weatherDataModel.temprature)"
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
    }
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            let params: [String: String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            getWeatherData(url : WEATHER_URL, parameters : params)
            print("longitude : \(location.coordinate.longitude) & latitude: \(location.coordinate.latitude)")
        }
    }
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error);
        cityLabel.text = "Location unavailable"
    }
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.delegate = self
        }
    }
    
    
    @IBAction func onChange(_ sender: Any) {
        weatherDataModel.temprature  = getWeather(weatherDataModel.kelvinTemperature)
        updateUIWithWeatherData()
    }
    
    
}


