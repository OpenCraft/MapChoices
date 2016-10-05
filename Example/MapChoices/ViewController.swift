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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showMapsDidTouch(sender: AnyObject) {
        let testLocation = CLLocationCoordinate2D(latitude: 37.3314187, longitude: -122.0325976)
        
        MapChoices.presentMapChoicesInViewController(self, coordinate: testLocation)
    }

}

