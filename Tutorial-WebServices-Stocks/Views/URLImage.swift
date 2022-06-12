//
//  URLImage.swift
//  Tutorial-WebServices-Stocks
//
//  Created by David Malicke on 6/12/22.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @StateObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        
        VStack {
            
            if let data = imageLoader.downloadedData {
                Image(uiImage: UIImage(data: data)!)
                    .resizable()
            
            } else {
                Image("placeholder").resizable()
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Schematic_diagram_of_the_human_eye_en.svg/236px-Schematic_diagram_of_the_human_eye_en.svg.png")
    }
}
