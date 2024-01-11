//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//

import SwiftUI

struct CoverImageView: View {
  
  var coverImages: [CoverImage]
  
  var body: some View {
    TabView {
      ForEach(coverImages) { item in
        Image(item.name)
          .resizable()
          .scaledToFill()
      }
    }
    .tabViewStyle(PageTabViewStyle())
  }
}

struct CoverImageView_Previews: PreviewProvider {
  static var previews: some View {
      CoverImageView(coverImages: PreviewData.coveImages)
      .previewLayout(.fixed(width: 400, height: 300))
  }
}
