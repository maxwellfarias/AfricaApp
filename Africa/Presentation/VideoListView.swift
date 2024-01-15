import SwiftUI

struct VideoListView: View {
    @ObservedObject var viewListViewModel: VideoListViewModel
  
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

  var body: some View {
    NavigationView {
      List {
          ForEach(viewListViewModel.videos) { video in
          NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
            VideoListItemView(video: video)
              .padding(.vertical, 8)
          }
        }
      }
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
              viewListViewModel.videos.shuffle()
            hapticImpact.impactOccurred()
          }) {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
    }
  }
}

struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
      VideoListView(viewListViewModel: PreviewData.listVideoViewModel)
      .previewDevice("iPhone 13")
  }
}
