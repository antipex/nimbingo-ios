//
//  BoardViewCell.swift
//  Nimbingo
//
//  Created by Kyle Rohr on 31/08/2016.
//  Copyright © 2016 Kyle Rohr. All rights reserved.
//

import UIKit

class BoardViewCell: UIView {

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    private var titleLabel = UILabel()

    init() {
        super.init(frame: CGRect.zero)

        titleLabel.textAlignment = .center

        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: self.frame.size.width,
            height: self.frame.size.height
        )
    }

}
