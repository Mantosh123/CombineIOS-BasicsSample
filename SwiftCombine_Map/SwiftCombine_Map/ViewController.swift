//
//  ViewController.swift
//  SwiftCombine_Map
//
//  Created by Mantosh Kumar on 17/12/24.
//

import UIKit
import Combine

struct FormField1 {
    var value: Int
}

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.textPublisher
            .map({ value -> FormField1 in
                FormField1(value: Int(value) ?? 0)
            })
            .sink { value in
                print("value: \(value)")
            }.store(in: &cancellables)
        
    }


}

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .eraseToAnyPublisher()
    }
}
