//
//  ViewController.swift
//  HWSProject16
//
//  Created by Ahuja, Abhishek on 6/11/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    var mapview : MKMapView!
    override func viewDidLoad() {
        mapview = MKMapView()
        view.addSubview(mapview)
        mapview.translatesAutoresizingMaskIntoConstraints = false
        mapview?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapview?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapview?.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mapview?.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        mapview.addAnnotations([london, oslo, paris, rome, washington])
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else {return nil}
        let identifier = "Capital"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true

            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn

        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }


}

