//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//

import SwiftUI

struct AnimalGridItemView: View {
  // MARK: - PROPERTIES
  
  let animal: Animal

  // MARK: - BODY

  var body: some View {
    Image(animal.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
  }
}

// MARK: - PREVIEW

struct AnimalGridItemView_Previews: PreviewProvider {
  
  static var previews: some View {
      AnimalGridItemView(animal: PreviewData.animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
