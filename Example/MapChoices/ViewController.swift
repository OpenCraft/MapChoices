//
//  ViewController.swift
//  MapChoices
//
//  Created by Cleber on 10/05/2016.
//  Copyright (c) 2016 Cleber. All rights reserved.
//

import UIKit
import CoreLocation
import MapChoices

class ViewController: UIViewController {
    
    @IBAction func showMapsDidTouch(sender: AnyObject) {
        let testLocation = CLLocationCoordinate2D(latitude: 37.3314187, longitude: -122.0325976)
        
        MapChoices.present(inViewController: self, coordinate: testLocation)
    }

}

