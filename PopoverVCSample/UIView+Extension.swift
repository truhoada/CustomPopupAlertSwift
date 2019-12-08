//
//  UIView+Extension.swift
//  PopoverVCSample
//
//  Created by Tà Truhoada on 08.12.19.
//  Copyright © 2019 truhoada. All rights reserved.
//

import UIKit

extension UIView {
    //MARK: Add Gesture Recognizer
    func addSingleTapGesture(target: Any?, selector: Selector) -> Void {
        let tap = UITapGestureRecognizer(target: target, action: selector)
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
}
