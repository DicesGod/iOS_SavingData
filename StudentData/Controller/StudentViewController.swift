//
//  StudentViewController.swift
//  StudentData
//
//  Created by Minh Le on 2019-04-03.
//  Copyright © 2019 Minh Le. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBAction func SaveStudent(_ sender: Any) {
        storeStudent{
            (done) in
            if done{
                navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            }
            else{
                //Try to save again using new data
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StudentViewController{
    func storeStudent(completion: (_ done:Bool) ->()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let student =  Student(context: managedContext)
        student.firstName = firstNameTextField.text
        student.lastName = lastNameTextField.text
        
        do{
            try managedContext.save()
//            let alert = UIAlertController()
            print("Student saved!")
            completion(true)
        } catch{
            print("Failed to save student: ", error.localizedDescription)
            completion(false)
        }
        
        
    }
}
