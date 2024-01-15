//
//  PreviewData.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 07/01/24.
//

import Foundation

class PreviewData {
    @Injected(\.homeViewModel) static var homeViewModel
    @Injected(\.videoListViewModel) static var listVideoViewModel
    @Injected(\.mapViewModel) static var mapViewModel
    @Injected(\.galleryViewModel) static var galleryViewModel
    
    static var animals:[Animal] {homeViewModel.animals}
    static var coveImages:[CoverImage] {homeViewModel.coverImages}
    static var videos: [AnimalVideo] {listVideoViewModel.videos}
    static var locations: [NationalParkLocation] {mapViewModel.locations}
    static var galleryAnimals: [Animal] {galleryViewModel.animals}
}
