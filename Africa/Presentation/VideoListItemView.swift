//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//

import SwiftUI

struct VideoListItemView: View {
  let video: AnimalVideo

  var body: some View {
    HStack(spacing: 10) {
      ZStack {
        Image(video.thumbnail)
          .resizable()
          .scaledToFit()
          .frame(height: 80)
          .cornerRadius(9)
        
        Image(systemName: "play.circle")
          .resizable()
          .scaledToFit()
          .frame(height: 32)
          .shadow(radius: 4)
      }
      
      VStack(alignment: .leading, spacing: 10) {
        Text(video.name)
          .font(.title2)
          .fontWeight(.heavy)
          .foregroundColor(.accentColor)
        
        Text(video.headline)
          .font(.footnote)
          .multilineTextAlignment(.leading)
          .lineLimit(2)
      }
    }
  }
}

struct VideoListItem_Previews: PreviewProvider {
  static var previews: some View {
      VideoListItemView(video: PreviewData.listVideoViewModel.videos[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
