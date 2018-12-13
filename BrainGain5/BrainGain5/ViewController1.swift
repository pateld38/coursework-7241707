//
//  ViewController1.swift
//  BrainGain5
//
//  Created by Dhruv Patel on 13/12/2018.
//  Copyright © 2018 Dhruv Patel. All rights reserved.
//

import UIKit

class ViewController1: UIViewController, UITextFieldDelegate {
    
    
    @IBAction func AddTask(_ sender: UIButton) {
    }
    
    @IBOutlet weak var Write1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Write1.resignFirstResponder()
        return(true)
    }
}

