//
//  ManageCameraMakeUp.swift
//  Easy Camera Makeup
//
//  Created by haiphan on 26/01/2023.
//

import Foundation
import Photos
import UIKit
import RxRelay

final class ManageCameraMakeUp {
    
    static var shared = ManageCameraMakeUp()
    
    private init() {
        fetchAlbums()
    }
    var albumsPhoto: BehaviorRelay<[AlbumModels]> = BehaviorRelay.init(value: [])
    
    func fetchAlbums() {
        var list: [AlbumModels] = []
        let albumsPhoto:PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .album,
                                                                                                   subtype: .albumRegular,
                                                                                                   options: nil)
        
        albumsPhoto.enumerateObjects({ [weak self] (collection, index, object) in
            guard let self = self else { return }
            let photoInAlbum = PHAsset.fetchAssets(in: collection, options: nil)
            let model = AlbumModels(title: collection.localizedTitle,
                                    count: photoInAlbum.count,
                                    fetchResult: photoInAlbum)
            list.append(model)
            self.albumsPhoto.accept(list)
        })
    }
    
    func calculateSizeCell(collectionView: UICollectionView, numberOfCell: Int) -> Int {
        let width = ((Int(collectionView.bounds.size.width)) / numberOfCell)
        return Int(width)
    }
    
    func topViewController(controller: UIViewController? = UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController ) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
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

