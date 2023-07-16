//
//  LocationDetailsView.swift
//  'Za Hunter
//
//  Created by Jeffrey Lin on 7/5/23.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    var body: some View {
        let address = selectedMapItem.placemark.subThoroughfare! + " " + // street address number
        selectedMapItem.placemark.thoroughfare! + "\n" + // street name
        selectedMapItem.placemark.locality! + ", " + // city
        selectedMapItem.placemark.administrativeArea! + " " + // state
        selectedMapItem.placemark.postalCode! // zip code
        VStack {
            Color.gray
            Text(selectedMapItem.name!)
                .font(.title)
                .foregroundColor(.green)
            Text(address)
                .multilineTextAlignment(.center)
            Text(selectedMapItem.phoneNumber!)
                .padding()
            Link(destination: selectedMapItem.url!) {
                Text("Website")
                    .padding()
                Button {
                    let latitude = selectedMapItem.placemark.coordinate.latitude
                    let longitude = selectedMapItem.placemark.coordinate.longitude
                    let url = URL(string: "maps://?daddr=\(latitude),\(longitude)")
                    if UIApplication.shared.canOpenURL(url!) {
                        UIApplication.shared.open(url!, options: [:])
                    }
                } label: {
                    Text("Directions")
                }
            }
            Image("Pizza 1")
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
        }
        .background(.gray)
    }
    var selectedMapItem: MKMapItem
}

struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(selectedMapItem: MKMapItem())
    }
}
