//
//  ViewController.swift
//  testapp
//
//  Created by Cyprien Chamayou on 23/11/2017.
//  Copyright © 2017 Cyprien Chamayou. All rights reserved.
//

import UIKit
import Firebase

class Exercice : UIViewController, UITextFieldDelegate {
    
    @IBOutlet var lbTitle : UILabel!
    @IBOutlet var lbQuestion : UILabel!
    @IBOutlet var tfNombreEntre : UITextField!
    @IBOutlet var bFin : UIButton!
    @IBOutlet var sAuto : UISwitch!
    @IBOutlet var slnumber : UISlider!
    @IBOutlet var stNumber : UIStepper!
    var modeAuto : BooleanLiteralType = false
    var niveau : Int!
    var goodAnswer : Int!
    
    var calcul : CalculExercice!
    
    var ref: DatabaseReference!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tfNombreEntre.delegate = self
        tfNombreEntre.keyboardType = UIKeyboardType.numberPad
        slnumber.maximumValue = 99
        stNumber.maximumValue = 99
        
        calcul = CalculExercice(difficulte : niveau)
        calcul.fillTitle(label: lbTitle)
        lbQuestion.text = calcul.consigne
        
        ref = Database.database().reference()
        
        ref.child("testIOS").observeSingleEvent(of: .value, with: {(snapshot) in
            print(snapshot.value as? String! as Any)
        })
        
        /*Auth.auth().createUser(withEmail: "iphone@test.fr", password: "password") { (user, error) in
            // ...
        }*/
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func clicSurFin(sender : UIButton) {
        //On vérifie que le texte entré par l'utilisateur n'est pas nil
        if let resultat = tfNombreEntre.text, resultat != "" {
            //On regarde si le résultat est 8
            if Int(resultat) == calcul.reponse {
                alert("Bravo", message: "C'est une bonne réponse")
            } else {
                alert("Faux", message: "Ce n'est pas la bonne réponse, réessayez !")
            }
        } else {
            alert("Champ vide", message: "Veuillez entrer une valeur")
        }
    }
    
    @IBAction func autoOnOff (sender : UISwitch){
        modeAuto = sender.isOn
        bFin.isHidden = modeAuto
        slnumber.isHidden = modeAuto
        stNumber.isHidden = modeAuto
    }
    
    @IBAction func texteModifie (sender : UITextField){
        if let resultat = sender.text {
            if let entier = Int(resultat) {
                if entier > 99 {
                    sender.text = "99"
                }
                slnumber.setValue(Float(entier), animated: true)
                stNumber.value = Double(entier)
                
            }
        }
    }
    
    @IBAction func sliderMove(sender : UISlider){
        let entier = Int(sender.value)
        tfNombreEntre.text = String(entier)
        stNumber.value = Double(entier)
    }
    
    @IBAction func stepperTouched(sender : UIStepper){
        let entier = Int(sender.value)
        tfNombreEntre.text = String(entier)
        slnumber.value = Float(entier)
        
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if modeAuto {
            if let resultat = textField.text, resultat != "" {
                let intResultat = Int(resultat)
                testAnswer(answer: intResultat!)
            }
        }
        return true
    }
    
    func testAnswer (answer : Int){
        if modeAuto {
            if answer == calcul.reponse {
                alert("Bravo", message: "C'est une bonne réponse !")
            } else {
                alert("Faux", message: "Ce n'est pas la bonne réponse.")
            }
            
        }
    }


}

