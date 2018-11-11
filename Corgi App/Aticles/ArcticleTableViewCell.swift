//
//  ArcticleTableViewCell.swift
//  Corgi App
//
//  Created by Александр Сахнюков on 06/11/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

class ArcticleTableViewCell: UITableViewCell {
    var aticle:Article? {
        didSet {
            customiseCell()
        }
    }
    @IBOutlet weak var review: UILabel!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customiseCell()
        
        // Initialization code
    }
    
private func   customiseCell() {
    date.text = aticle?.creationDate.dateToString(date: aticle?.creationDate)
    date.textColor = .gray
    self.backgroundColor = .mainWhite
    title.text = aticle?.title
    guard let reviewText = aticle?.review else { return review.text = "" }
    review.text = reviewText
    return
}
}
