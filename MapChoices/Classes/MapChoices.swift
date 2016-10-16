import CoreLocation
import UIKit

public class MapChoices {
    
    private static let WAZE = "Waze"
    private static let GOOGLEMAPS = "Google Maps"
    private static let APPLEMAPS = "Apple Maps"
    
    private struct Provider {
        var name: String
        var url: NSURL
    }
    
    public static func presentMapChoicesInViewController(viewController: UIViewController, coordinate: CLLocationCoordinate2D) {
        let choicesAlert = UIAlertController(title: "Maps", message: "Choose a provider", preferredStyle: .ActionSheet)
        
        getProviders(coordinate).forEach { provider in
            choicesAlert.addAction(UIAlertAction(title: provider.name, style: .Default, handler: { _ in
                UIApplication.sharedApplication().openURL(provider.url)
            }))
        }
        
        choicesAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        viewController.presentViewController(choicesAlert, animated: true, completion: nil)
    }
    
    private static func getProviders(coordinate: CLLocationCoordinate2D) -> [Provider] {
        
        var providers = [Provider]()
        
        if let appleMapsURL = NSURL(string: "http://maps.apple.com/?daddr=\(String(coordinate.latitude)),\(String(coordinate.longitude))") {
            if UIApplication.sharedApplication().canOpenURL(appleMapsURL) {
                providers.append(Provider(name: APPLEMAPS, url: appleMapsURL))
            }
        }
        
        if let wazeURL = NSURL(string: "waze://?ll="+String(coordinate.latitude)+","+String(coordinate.longitude)+"&navigate=yes") {
            if UIApplication.sharedApplication().canOpenURL(wazeURL) {
                providers.append(Provider(name: WAZE, url: wazeURL))
            }
        }
        
        if let googleMapsURL = NSURL(string: "comgooglemaps://?daddress="+String(coordinate.latitude)+","+String(coordinate.longitude)) {
            if UIApplication.sharedApplication().canOpenURL(googleMapsURL) {
                providers.append(Provider(name: GOOGLEMAPS, url: googleMapsURL))
            }
        }
        
        return providers
        
    }
    
}
