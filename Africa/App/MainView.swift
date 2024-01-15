//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//

import SwiftUI

struct MainView: View {
    @Injected(\.homeViewModel) var homeViewModel
    @Injected(\.videoListViewModel) var videoListViewModel
    @Injected(\.mapViewModel) var mapViewModel
    @Injected(\.galleryViewModel) var galleryViewModel
    
    
    var body: some View {
        TabView {
            HomeScreen(homeScreenViewModel: homeViewModel)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
                .environmentObject(mapViewModel)
            
            VideoListView(viewListViewModel: videoListViewModel)
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            
            MapView(mapViewModel: mapViewModel)
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
            
            GalleryView(galleryViewModel: galleryViewModel)
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 13")
    }
}
