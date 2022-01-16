//
//  CircularImageView.swift
//  TestTechniqueKlaxitMaximeGernath
//
//  Created by Maxime Gernath on 15/01/2022.
//

import Foundation
import UIKit

@IBDesignable
class CircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}
