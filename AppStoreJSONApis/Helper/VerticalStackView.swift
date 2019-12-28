//
//  VerticalStackView.swift
//  AppStoreJSONApis
//
//  Created by zombietux on 2019/12/28.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
