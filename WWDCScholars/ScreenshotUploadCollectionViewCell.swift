//
//  ScreenshotUploadCollectionViewCell.swift
//  WWDCScholars
//
//  Created by Andrew Walker on 12/04/2016.
//  Copyright © 2016 WWDCScholars. All rights reserved.
//

import UIKit

protocol ScreenshotImportDelegate {
    func importNewScreenshot(index: Int)
    func presentActionSheet(index: Int)
}

class ScreenshotUploadCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!
    
    var delegate: ScreenshotImportDelegate?
    
    override func awakeFromNib() {
        self.styleUI()
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ScreenshotUploadCollectionViewCell.cellLongPressed))
        self.uploadButton.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    private func styleUI() {
        self.titleTextLabel.textColor = UIColor.scholarsPurpleColor()
        self.iconImageView.tintColor = UIColor.scholarsPurpleColor()
    }
    
    internal func cellLongPressed() {
        self.delegate?.presentActionSheet(self.tag)
    }
    
    @IBAction func uploadButtonTapped(sender: AnyObject) {
        self.delegate?.importNewScreenshot(self.tag)
    }
}
