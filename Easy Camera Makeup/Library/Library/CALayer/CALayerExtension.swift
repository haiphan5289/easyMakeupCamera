//
//  CALayerExtension.swift
//  AudioRecord
//
//  Created by haiphan on 13/11/2021.
//

import Foundation
import UIKit

//extension CA
extension CALayer {
  func applySketchShadow(
    color: UIColor = .red,
    alpha: Float = 0.6,
    x: CGFloat = 0,
    y: CGFloat = 5,
    blur: CGFloat = 14,
    spread: CGFloat = 0)
  {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}
