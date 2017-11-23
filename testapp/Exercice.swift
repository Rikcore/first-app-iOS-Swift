//
//  ViewController.swift
//  testapp
//
//  Created by Cyprien Chamayou on 23/11/2017.
//  Copyright © 2017 Cyprien Chamayou. All rights reserved.
//

import UIKit

class Exercice : UIViewController {
    
    @IBOutlet var tfNombreEntre : UITextField!
    @IBOutlet var bFin : UIButton!
    @IBOutlet var sAuto : UISwitch!
    var modeAuto : BooleanLiteralType = false

    override func viewDidLoad() {
        super.viewDidLoad()
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
        if modeAuto {
            if let resultat = sender.text, resultat != "" {
                if Int(resultat) == 8{
                    alert("Bravo", message: "T'es trop fort")
                }
            }
        }
    }


}

