//
//  BasicButtonStyle.swift
//  SwiftUIChallange2
//
//  Created by Oguzhan Ozturk on 1.04.2023.
//

import SwiftUI

struct BasicButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
            .foregroundColor(.black)
            .background(.white)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 2))
    }
    
}
