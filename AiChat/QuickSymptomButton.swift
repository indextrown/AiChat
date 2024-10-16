//
//  QuickSymptomButton.swift
//  AiChat
//
//  Created by 김동현 on 10/16/24.
//

import SwiftUI

struct QuickSymptomButton: View {
    let symptom: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(symptom)
                .font(.caption)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

