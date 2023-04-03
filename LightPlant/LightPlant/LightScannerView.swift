//
//  LightScannerView.swift
//  LightPlant
//
//  Created by Russell Floyd Jr. on 3/29/23.
//

import SwiftUI

struct LightScannerView: View {
    var body: some View {
        TheRealLightScannerView()
            .ignoresSafeArea()
    }
}

struct LightScannerView_Previews: PreviewProvider {
    static var previews: some View {
        LightScannerView()
    }
}
