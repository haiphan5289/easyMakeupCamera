//
//  AlbumsCell.swift
//  Easy Camera Makeup
//
//  Created by haiphan on 26/01/2023.
//

import UIKit
import EasyBaseCodes

class AlbumsCell: UICollectionViewCell {
    
    private let albumView: AlbumViewCell = .loadXib()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addSubview(albumView)
        albumView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        albumView.clipsToBounds = true
        albumView.cornerRadius = 15
        layer.cornerRadius = 15
        clipsToBounds = true
        layer.applySketchShadow()
    }
    
}
extension AlbumsCell {
    
    func bindModel(model: AlbumModels) {
        albumView.bindModel(model: model)
    }
    
}
