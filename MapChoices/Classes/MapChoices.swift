import CoreLocation
import UIKit

public struct MapChoices {
    
    private static let WAZE = "Waze"
    private static let GOOGLEMAPS = "Google Maps"
    private static let APPLEMAPS = "Apple Maps"
    
    private struct Provider {
        var name: String
        var url: NSURL
    }
    
    @available(*, deprecated, message: "Use presentMapChoices(inViewController:coordinate:) instead")
    public static func presentMapChoicesInViewController(viewController: UIViewController, coordinate: CLLocationCoordinate2D) {
        present(in: viewController, coordinate: coordinate)
    }
    
    public static func present(in viewController: UIViewController, coordinate: CLLocationCoordinate2D) {
        let alert = UIAlertController(title: "Mapas", message: "Selecione uma opção de navegação", preferredStyle: .actionSheet)
        
        getProviders(coordinate: coordinate).forEach { provider in
            alert.addAction(UIAlertAction(title: provider.name, style: .default, handler: { _ in
                UIApplication.shared.openURL(provider.url as URL)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    private static func getProviders(coordinate: CLLocationCoordinate2D) -> [Provider] {
        
        var providers = [Provider]()
        
        if let appleMapsURL = NSURL(string: "http://maps.apple.com/?daddr=\(String(coordinate.latitude)),\(String(coordinate.longitude))") {
            if UIApplication.shared.canOpenURL(appleMapsURL as URL) {
                providers.append(Provider(name: APPLEMAPS, url: appleMapsURL))
            }
        }
        
        if let wazeURL = NSURL(string: "waze://?ll="+String(coordinate.latitude)+","+String(coordinate.longitude)+"&navigate=yes") {
            if UIApplication.shared.canOpenURL(wazeURL as URL) {
                providers.append(Provider(name: WAZE, url: wazeURL))
            }
        }
        
        if let googleMapsURL = NSURL(string: "comgooglemaps://?daddress="+String(coordinate.latitude)+","+String(coordinate.longitude)) {
            if UIApplication.shared.canOpenURL(googleMapsURL as URL) {
                providers.append(Provider(name: GOOGLEMAPS, url: googleMapsURL))
            }
        }
        
        return providers
    }
}
