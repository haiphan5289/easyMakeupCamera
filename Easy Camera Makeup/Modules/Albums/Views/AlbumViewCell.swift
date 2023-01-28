//
//  AlbumViewCell.swift
//  Easy Camera Makeup
//
//  Created by haiphan on 27/01/2023.
//

import UIKit
import EasyBaseCodes

class AlbumViewCell: UIView {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
extension AlbumViewCell {
    
    func bindModel(model: AlbumModels) {
        titleLabel.text = model.title
        countLabel.text = "Số lượng: \(model.count ?? 0)"
        let dateString = model.fetchResult?.firstObject?.modificationDate?.covertToString(format: .HHmmddMMyyyy) ?? ""
        dateLabel.text = "Last Edited:  \(dateString)"
        if let first = model.fetchResult?.firstObject?.toImage(imageSize: img.size) {
            img.image = first.resizeImageSpace(width: img.size.width)
        }
    }
    
}
