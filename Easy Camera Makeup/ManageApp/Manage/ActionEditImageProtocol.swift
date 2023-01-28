//
//  ActionEditImageProtocol.swift
//  Easy Camera Makeup
//
//  Created by haiphan on 27/01/2023.
//

import Foundation

protocol ActionEditImageProtocol: AnyObject {}
extension ActionEditImageProtocol {
    
    func openSelectImage(album: AlbumModels) {
        guard let topVC = ManageCameraMakeUp.shared.topViewController() else {
            return
        }
        let vc = SelectPhotoVC.createVC()
        vc.albumdModel = album
        topVC.navigationController?.pushViewController(vc, animated: true)
    }
    
}
