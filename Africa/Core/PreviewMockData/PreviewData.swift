//
//  PreviewData.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 07/01/24.
//

import Foundation

class PreviewData {
    @Injected(\.homeViewModel) static var homeViewModel
    
    static var animals:[Animal] {homeViewModel.animals}
    static var coveImages:[CoverImage] {homeViewModel.coverImages}
}
