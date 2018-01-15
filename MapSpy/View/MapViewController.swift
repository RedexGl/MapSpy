//
//  MapViewController.swift
//  MapSpy
//
//  Created by Igor Shevchenko on 1/11/18.
//  Copyright © 2018 Igor Shevchenko. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {

    var controller:DataController?
    
    var start:CLLocationCoordinate2D?
    
    var end:CLLocationCoordinate2D?
    
    
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.controller = DataController(self)
        
        var homeLati: CLLocationDegrees = 40.01540192
        var homeLong: CLLocationDegrees = 20.87901079
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
       
        var myHome:CLLocationCoordinate2D = CLLocationCoordinate2DMake(homeLati, homeLong)

        self.map.showsUserLocation = true
        self.map.delegate = self
        ///Red Pin
        var myHomePin = MKPointAnnotation()
        myHomePin.coordinate =  myHome
        myHomePin.title = "Home"
        myHomePin.subtitle = "Bogdan's home"
        self.map.addAnnotation(myHomePin)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func longPress(sender: UITapGestureRecognizer){
        
        let point = sender.location(in: self.map)
        
        let location = map.convert(point, toCoordinateFrom: self.map)
        
        if start == nil{
            start=location
            var myHomePin = MKPointAnnotation()
            myHomePin.coordinate =  location
            myHomePin.title = "Start"
            myHomePin.subtitle = "Bogdan's home"
            self.map.addAnnotation(myHomePin)
        }else{
            end = location
            var myHomePin = MKPointAnnotation()
            myHomePin.coordinate =  location
            myHomePin.title = "End"
            myHomePin.subtitle = "Bogdan's home"
            self.map.addAnnotation(myHomePin)
            
            //self.controller?.requestRoute(start: start, end: end, completion: { (result, error) in
                
            //})
            
                self.controller?.requestRoute(start: start!, end: end!)
            
            
        }

    }
    
    
    
    func routeReceived(route:[CLLocationCoordinate2D]){
        
        let polyline =  MKGeodesicPolyline(coordinates: route, count: route.count)
        
        self.map.add(polyline)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

        var polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blue
            polylineRenderer.lineWidth = 5
            return polylineRenderer
        
        
        
    }
    
    

}
