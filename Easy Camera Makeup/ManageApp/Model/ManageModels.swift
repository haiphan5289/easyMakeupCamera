//
//  ManageModels.swift
//  Easy Camera Makeup
//
//  Created by haiphan on 27/01/2023.
//

import Foundation
import UIKit
import Photos

struct AlbumModels {
    let title: String?
    let count: Int?
    let fetchResult: PHFetchResult<PHAsset>?
    
    func getTitle() -> String {
        return (title ?? "") + " (\(count ?? 0))"
    }
}
