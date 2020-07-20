//
//  DetailVC.swift
//  GoT
//
//  Created by Harsh Verma on 19/07/20.
//  Copyright © 2020 Harsh Verma. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionImageView: UIImageView!
    @IBOutlet weak var coatTextView: UITextView!
    @IBOutlet weak var coatOfArms: UILabel!
    var houseInfo1: houseInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if houseInfo1 == nil {
            houseInfo1 = houseInfo(name: "", region: "", coatOfArms: "", words: "")
        }
        updateUI()
    }

    func updateUI() {
        nameLabel.text = houseInfo1.name
        wordsLabel.text = houseInfo1.words
        if wordsLabel.text != "" {
            wordsLabel.text = "\"\(houseInfo1.words)\""
        }
        
        regionLabel.text = houseInfo1.region
        regionImageView.image = UIImage(named: houseInfo1.region)
        coatTextView.text = houseInfo1.coatOfArms
        if coatTextView.text == "" {
            coatOfArms.isHidden = true
        }
    }
    
}
