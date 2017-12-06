//
//  ViewController.swift
//  testapp
//
//  Created by Cyprien Chamayou on 23/11/2017.
//  Copyright © 2017 Cyprien Chamayou. All rights reserved.
//

import UIKit

class Exercice : UIViewController, UITextFieldDelegate {
    
    @IBOutlet var tfNombreEntre : UITextField!
    @IBOutlet var bFin : UIButton!
    @IBOutlet var sAuto : UISwitch!
    @IBOutlet var slnumber : UISlider!
    @IBOutlet var stNumber : UIStepper!
    var modeAuto : BooleanLiteralType = false

    override func viewDidLoad() {
        super.viewDidLoad()
        tfNombreEntre.delegate = self
        slnumber.maximumValue = 99
        stNumber.maximumValue = 99
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
            if Int(resultat) == 8 {
                alert("Bravo", message: "4 + 4 = 8\nC'est une bonne réponse")
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if modeAuto {
            if let resultat = textField.text, resultat != "" {
                if Int(resultat) == 8 {
                    alert("Bravo tu gères", message: "T'es trop bon !")
                } else {
                    alert("Boloss", message: "T'es trop nul...")
                }
            }
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if modeAuto {
            if let resultat = textField.text, resultat != "" {
                if Int(resultat) == 8 {
                    alert("Bravo tu gères", message: "T'es trop bon !")
                } else {
                    alert("Boloss", message: "T'es trop nul...")
                }
            }
        }
        return true
    }


}

