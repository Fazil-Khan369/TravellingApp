//
//  RatingView.swift
//  TravelAppDCCW
//
//  Created by Fazil P on 16/11/20.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.orange
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maximumRating + 1) { number in
                self.image(for:number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture{
                        self.rating = number
                    }
            }
        }
    }
    func image(for number : Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}





