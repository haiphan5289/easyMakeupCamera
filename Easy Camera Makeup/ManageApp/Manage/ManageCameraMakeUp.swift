//
//  ManageCameraMakeUp.swift
//  Easy Camera Makeup
//
//  Created by haiphan on 26/01/2023.
//

import Foundation
import Photos

final class ManageCameraMakeUp {
    
    static var shared = ManageCameraMakeUp()
    private init() {
        fetchAlbums()
    }
    
    
    func fetchAlbums() {
        let albumsPhoto:PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .album,
                                                                                                   subtype: .albumRegular,
                                                                                                   options: nil)
        
        albumsPhoto.enumerateObjects({(collection, index, object) in
            let photoInAlbum = PHAsset.fetchAssets(in: collection, options: nil)
            print("========= \(photoInAlbum.count)")
            print("========= \(collection.localizedTitle)")
            
        })
    }
    
}
