//
//  UIImage+Extension.swift
//  Beberia
//
//  Created by haiphan on 09/03/2022.
//  Copyright © 2022 IMAC. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func isEqualToImage(image: UIImage) -> Bool {
        let data1: Data = self.pngData()!
        let data2: Data = image.pngData()!
        return data1 == data2
    }
}
