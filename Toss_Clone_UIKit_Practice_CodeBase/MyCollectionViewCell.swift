//
//  MyCollectionViewCell.swift
//  Toss_Clone_UIKit_Practice_CodeBase
//
//  Created by 이창형 on 2022/07/04.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static var id: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    var dataLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    required init?(coder: NSCoder) {
            fatalError("Not implemented required init?(coder: NSCoder)")
        }

        private func configure() {
            dataLabel = UILabel()
            dataLabel.font = UIFont.systemFont(ofSize: 32)
            dataLabel.textColor = .label
            dataLabel.textAlignment = .center

            contentView.addSubview(dataLabel)
            
        }
    }
