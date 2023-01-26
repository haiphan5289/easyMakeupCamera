//
//  ManageCameraMakeUp.swift
//  Easy Camera Makeup
//
//  Created by haiphan on 26/01/2023.
//

import Foundation
import Photos
import UIKit

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
            let first = photoInAlbum.firstObject
            print("========= \(photoInAlbum.count)")
            print("========= \(collection.localizedTitle)")
            
        })
    }
    
}
extension PHAsset {
    
    func toImage(imageSize: CGSize) -> UIImage? {
        var thumbnail = UIImage()
        let imageManager = PHCachingImageManager()
        imageManager.requestImage(for: self, targetSize: imageSize,
                                  contentMode: .aspectFit,
                                  options: nil, resultHandler: { image, _ in
            guard let img = image else {
                return
            }
            thumbnail = img
        })
        return thumbnail
    }
}

