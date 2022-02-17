//
//  ASAAttributedLabel.swift
//  superapp
//
//  Created by Amit on 17/8/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public typealias ASAAttributedLabelIndex = Int
public typealias ASAAttributeIndex = Int
public typealias ASAAttributedLabelEventClosure = (ASAAttributedLabelIndex, ASAAttributeIndex, ASAAttribute) -> Void
public typealias ASAAttributedLabelEventsClosure = (ASAAttributedLabelIndex, [ASAAttributeIndex], [ASAAttribute]) -> Void

public class ASAAttributedLabel: UILabel {
    final var index: Int = 0
    final var attributes: [ASAAttribute]?
    final var selectionEvent: ASAAttributedLabelEventClosure?
    final var selectionEvents: ASAAttributedLabelEventsClosure?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        if let attributes = attributes {
            for (index, attribute) in attributes.enumerated() {
                if let value = attribute.value {
                    let termsRange = (self.text! as NSString).range(of: value)
                    if gesture.didTapAttributedTextInLabel(asLabel: self, inRange: termsRange) {
                        selectionEvent?(self.index, index, attribute)
                        break
                    }
                }
            }
            
            var _indexes: [Int] = [Int]()
            var _attributes: [ASAAttribute] = [ASAAttribute]()
            for (index, attribute) in attributes.enumerated() {
                if let value = attribute.value {
                    let termsRange = (self.text! as NSString).range(of: value)
                    if gesture.didTapAttributedTextInLabel(asLabel: self, inRange: termsRange) {
                        _indexes.append(index)
                        _attributes.append(attribute)
                    }
                }
            }
            selectionEvents?(self.index, _indexes, _attributes)
        }
    }
    
}

extension ASAAttributedLabel {
    @discardableResult
    public func setAttributes(_ attributes: [ASAAttribute]?) -> ASAAttributedLabel {
        self.attributes = attributes
        if #available(iOS 9.0, *) {
            let attriString = getAttributedStringWith(attributes.unsafelyUnwrapped)
            self.attributedText = attriString
            self.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
        } else {
            // Fallback on earlier versions
        }
        return self
    }
    
    @discardableResult
    public func setEvent(_ selectionEvent: ASAAttributedLabelEventClosure?) -> ASAAttributedLabel {
        self.isUserInteractionEnabled = true
        self.selectionEvent = selectionEvent
        return self
    }
    
    @discardableResult
    public func setEvents(_ selectionEvents: ASAAttributedLabelEventsClosure?) -> ASAAttributedLabel {
        self.isUserInteractionEnabled = true
        self.selectionEvents = selectionEvents
        return self
    }
}

