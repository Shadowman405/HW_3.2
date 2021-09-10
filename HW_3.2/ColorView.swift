//
//  ColorView.swift
//  HW_3.2
//
//  Created by Maxim Mitin on 10.09.21.
//

import SwiftUI

struct ColorView: View {
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15).frame(width: 400, height: 150).foregroundColor(color).overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 4))
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(color: .blue)
    }
}
