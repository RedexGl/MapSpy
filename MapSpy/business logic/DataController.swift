//
//  DataController.swift
//  MapSpy
//
//  Created by Igor Shevchenko on 1/15/18.
//  Copyright © 2018 Igor Shevchenko. All rights reserved.
//

import UIKit
import MapKit

class DataController: NSObject {

    let mapVC:MapViewController
    var networkInterface:NetworkInterface?
    
    init(_ mapVC:MapViewController) {
        
        self.mapVC = mapVC
        self.networkInterface = NetworkInterface()
        super.init()
        self.networkInterface?.controller = self
    }
    
    func requestRoute(start:CLLocationCoordinate2D, end:CLLocationCoordinate2D, completion: ((Any?,Error?) -> Void) ) {
    
    }
    
    func requestRoute(start:CLLocationCoordinate2D, end:CLLocationCoordinate2D) {
            self.networkInterface?.requestRoute(start: start, end: end)
    }
    
    
    
    //delegate
    
    func routeReceived(route:[CLLocationCoordinate2D]){
        mapVC.routeReceived(route: route)
    }
}
