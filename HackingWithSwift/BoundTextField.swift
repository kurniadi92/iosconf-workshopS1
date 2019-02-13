//
//  BoundTextField.swift
//  HackingWithSwift
//
//  Created by Kurniadi on 17/01/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

class Observable<ObservedType> {
    
    private var _value: ObservedType?
    var valueChanged: ((ObservedType?) -> ())?
    init(_ value: ObservedType) { _value = value }
    
    public var value: ObservedType? {
        get { return _value }
        set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
    }
}

class BoundTextField: UITextField {

    var changedClosure: (() -> ())?
    
    @objc func valueChanged() {
        changedClosure?()
    }
    
    func bind(to observable: Observable<String>) {
        addTarget(self, action:
            #selector(BoundTextField.valueChanged), for: .editingChanged)
        changedClosure = { [weak self] in
            observable.bindingChanged(to: self?.text ?? "")
        }
        observable.valueChanged = { [weak self] newValue in
            self?.text = newValue
        }
        self.text = observable.value
    }

}

class BoundSegmentedControl: UISegmentedControl {
    var changedClosure: (() -> ())?
    
    @objc func valueChanged() {
        changedClosure?()
    }
    
    func bind(to observable: Observable<Int>) {
        addTarget(self, action:
            #selector(BoundSegmentedControl.valueChanged), for: .valueChanged)
        changedClosure = { [weak self] in
            observable.bindingChanged(to: self?.selectedSegmentIndex ?? 0)
        }
        observable.valueChanged = { [weak self] newValue in
            self?.selectedSegmentIndex = newValue!
        }
        self.selectedSegmentIndex = observable.value!
    }
}
