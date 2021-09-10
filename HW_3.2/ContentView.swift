//
//  ContentView.swift
//  HW_3.2
//
//  Created by Maxim Mitin on 10.09.21.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = 122.0
    @State private var greenSliderValue = 122.0
    @State private var blueSliderValue = 122.0
    @State private var textFiledValue = 122.0
    @State private var textFieldText = ""
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack{
                ColorView(color: (Color(UIColor(displayP3Red: CGFloat(redSliderValue/255), green: CGFloat(greenSliderValue/255), blue: CGFloat(blueSliderValue/255), alpha: 1))))
                    .padding()
                HStack{
                    ColorSlider(value: $redSliderValue, color: .red)
                    TextField("", value: $redSliderValue, formatter: NumberFormatter())
                    .borderedTxtFld()
                }
                HStack{
                ColorSlider(value: $greenSliderValue, color: .green)
                    TextField("", value: $greenSliderValue, formatter: NumberFormatter())
                    .borderedTxtFld()
                }
                HStack{
                ColorSlider(value: $blueSliderValue, color: .blue)
                    TextField("", value: $blueSliderValue, formatter: NumberFormatter())
                    .borderedTxtFld()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack{
            Text("\(lround(value))").foregroundColor(.white)
                .padding()
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
        }
    }
}

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .frame(width: 40)
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(lineWidth: 3)
                        .foregroundColor(.white))
            .padding()
    }
}

extension TextField {
    func borderedTxtFld() -> some View {
        ModifiedContent(content: self, modifier: BorderedViewModifier())
    }
}
