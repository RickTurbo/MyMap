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

    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {

        print(searchKey)
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー")
    }
}
