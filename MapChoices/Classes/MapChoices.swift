import CoreLocation
import UIKit

public class MapChoices {
    
    private static let WAZE = "Waze"
    private static let GOOGLEMAPS = "Google Maps"
    private static let APPLEMAPS = "Apple Maps"
    
    private struct MapChoice {
        var name: String
        var url: NSURL
    }
    
    public static func presentMapChoicesInViewController(viewController: UIViewController, coordinate: CLLocationCoordinate2D) {
        let choicesAlert = UIAlertController(title: "Maps", message: "Choose a provider", preferredStyle: .ActionSheet)
        
        getMapChoices(coordinate).forEach { choice in
            choicesAlert.addAction(UIAlertAction(title: choice.name, style: .Default, handler: { _ in
                UIApplication.sharedApplication().openURL(choice.url)
            }))
        }
        
        choicesAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        viewController.presentViewController(choicesAlert, animated: true, completion: nil)
    }
    
    private static func getMapChoices(coordinate: CLLocationCoordinate2D) -> [MapChoice] {
        
        var mapChoices = [MapChoice]()
        
        if let appleMapsURL = NSURL(string: "http://maps.apple.com/?daddr=\(String(coordinate.latitude)),\(String(coordinate.longitude))") {
            if UIApplication.sharedApplication().canOpenURL(appleMapsURL) {
                mapChoices.append(MapChoice(name: APPLEMAPS, url: appleMapsURL))
            }
        }
        
        if let wazeURL = NSURL(string: "waze://?ll="+String(coordinate.latitude)+","+String(coordinate.longitude)+"&navigate=yes") {
            if UIApplication.sharedApplication().canOpenURL(wazeURL) {
                mapChoices.append(MapChoice(name: WAZE, url: wazeURL))
            }
        }
        
        if let googleMapsURL = NSURL(string: "comgooglemaps://?daddress="+String(coordinate.latitude)+","+String(coordinate.longitude)) {
            if UIApplication.sharedApplication().canOpenURL(googleMapsURL) {
                mapChoices.append(MapChoice(name: GOOGLEMAPS, url: googleMapsURL))
            }
        }
        
        return mapChoices
        
    }
    
}
