//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//

import Foundation

struct VideoModel: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  var thumbnail: String {
    "video-\(id)"
  }
}
