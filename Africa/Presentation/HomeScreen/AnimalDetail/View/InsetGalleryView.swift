//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//

import SwiftUI

struct InsetGalleryView: View {
  let animal: Animal

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 15) {
        ForEach(animal.gallery, id: \.self) { item in
          Image(item)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .cornerRadius(12)
        }
      }
    }
  }
}

struct InsetGalleryView_Previews: PreviewProvider {
  
  static var previews: some View {
      InsetGalleryView(animal: PreviewData.animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
