//
//  NetworkInterface.swift
//  MapSpy
//
//  Created by Igor Shevchenko on 1/15/18.
//  Copyright © 2018 Igor Shevchenko. All rights reserved.
//

import UIKit
import MapKit


class NetworkInterface: NSObject {
    
    var controller:DataController?
    let session = URLSession.shared
    
    let key = "AIzaSyBMkzn-VZ2jJ3rYC0doREgZ2BCDv_L7PSQ"
    
    func requestRoute(start:CLLocationCoordinate2D, end:CLLocationCoordinate2D) {
        
        //https://maps.googleapis.com/maps/api/directions/json?origin=41.43206,-81.38992&destination=41.43206,-81.38992&key=
        
        let urlString = String(format: "https://maps.googleapis.com/maps/api/directions/json?origin=%.5f,%.5f&destination=%.5f,%.5f&key=%@", start.latitude, start.longitude, end.latitude, end.longitude, key)
        
        let url:URL? = URL(string:urlString)
        
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            
            if error != nil {
            
            } else if data != nil {
                
                
                
                do {
                    if let data = data,
                        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                        let routes = json["routes"] as? [[String: Any]]{

                        
                        let rout0 = routes[0]
                        let legs = rout0["legs"] as! [[String: Any]]
                        
                        
                        var coordinates = [CLLocationCoordinate2D]()
                        
                        legs.forEach({ leg in
                            
                            let steps = leg["steps"] as! [[String: Any]]
                            steps.forEach({ step in
                                
                                let startLocation = step["start_location"] as! [String:NSNumber]
                                let endLocation = step["end_location"] as! [String:NSNumber]
                                
                                let startCoord = CLLocationCoordinate2D(latitude: (startLocation["lat"])!.doubleValue, longitude: (startLocation["lng"])!.doubleValue)
                                let endCoord = CLLocationCoordinate2D(latitude: (endLocation["lat"])!.doubleValue, longitude: (endLocation["lng"])!.doubleValue)
                                
                                coordinates.append(startCoord)
                                coordinates.append(endCoord)
                                
                            })
                            
                        })
                        
                        
                        
                        DispatchQueue.main.sync {
                            self.controller?.routeReceived(route: coordinates)
                        }
                        
                        
                    }
                } catch {
                    print("Error deserializing JSON: \(error)")
                }
                
                
                
            }
            
            
            
        }
        task.resume()
    }
}
