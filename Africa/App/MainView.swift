//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//

import SwiftUI

struct MainView: View {
    @Injected(\.homeViewModel) var homeViewModel
    
    
  var body: some View {
    TabView {
        HomeScreen(homeScreenViewModel: homeViewModel)
        .tabItem {
          Image(systemName: "square.grid.2x2")
          Text("Browse")
        }
      
      VideoListView()
        .tabItem {
          Image(systemName: "play.rectangle")
          Text("Watch")
        }
      
      MapView()
        .tabItem {
              Image(systemName: "map")
              Text("Locations")
        }
      
      GalleryView()
        .tabItem {
          Image(systemName: "photo")
          Text("Gallery")
        }
        
        
        
        
    } //: TAB
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .previewDevice("iPhone 13")
  }
}
