//
//  MyCustomCell.swift
//  HWSProject15
//
//  Created by Ahuja, Abhishek on 6/5/22.
//

import UIKit

class MyCustomCell: UICollectionViewCell {
    var imageView : UIImageView!
    var customLabel : UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView()
        customLabel = UILabel()
        customLabel.text = "custom"
        customLabel.font = .systemFont(ofSize: 10)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "penguin")
//        imageView.frame = bounds
        layer.cornerRadius = frame.height / 2.0
//        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        contentView.addSubview(customLabel)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        customLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        customLabel.leadingAnchor.constraint(equalTo:imageView.leadingAnchor, constant: 5).isActive = true
        customLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
//        customLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
