//
//  MapView.swift
//  MyMap
//
//  Created by 児島　陸斗 on 2022/04/26.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    let searchKey: String
    let mapType: MKMapType

    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {

        print(searchKey)

        uiView.mapType = mapType

        let geocoder = CLGeocoder()

        geocoder.geocodeAddressString(
            searchKey,
            completionHandler: { (placemarks, error) in

                if let unwrapPlacemarks = placemarks ,
                   let firstPlacemark = unwrapPlacemarks.first ,
                   let location = firstPlacemark.location {

                    let targetCordinate = location.coordinate

                    print(targetCordinate)

                    let pin = MKPointAnnotation()

                    pin.coordinate = targetCordinate

                    pin.title = searchKey

                    uiView.addAnnotation(pin)

                    uiView.region = MKCoordinateRegion(
                        center: targetCordinate,
                        latitudinalMeters: 500.0,
                        longitudinalMeters: 500.0
                    )
                }
            })
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー", mapType: .standard)
    }
}
