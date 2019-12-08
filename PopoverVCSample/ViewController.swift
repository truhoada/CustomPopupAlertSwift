//
//  ViewController.swift
//  PopoverVCSample
//
//  Created by Tà Truhoada on 08.12.19.
//  Copyright © 2019 truhoada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnShow: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        btnShow.addTarget(self, action: #selector(pressShowButton), for: .touchUpInside)
    }

    @objc func pressShowButton() {
        let popOverVC = RKRPointRankingInfoPopoverVC.init(animate: true, animationType: .scaleIn, nibName: "RKRPointRankingInfoPopoverVC")
        addChild(popOverVC)
        popOverVC.view.frame = view.frame
        view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
}

