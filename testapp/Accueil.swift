//
//  Accueil.swift
//  testapp
//
//  Created by Cyprien Chamayou on 01/12/2017.
//  Copyright © 2017 Cyprien Chamayou. All rights reserved.
//

import UIKit

class Accueil : UIViewController {
    
    //@IBOutlet var testButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*@IBAction func goExercice (sender : UIButton){
        let storyboard = UIStoryboard(name : "Main", bundle: nil)
        let exo = storyboard.instantiateViewController(withIdentifier: "exercice") as! Exercice
        navigationController?.showDetailViewController(exo, sender: self)
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let backItem = UIBarButtonItem()
        backItem.title = "Retour"
        navigationItem.backBarButtonItem = backItem
        
        if segue.identifier == "showExercice"{
            let exo = segue.destination as! Exercice
            exo.niveau = 1
        } else if segue.identifier == "showSecondExercice"{
            let exo = segue.destination as! Exercice
            exo.niveau = 2
        }
    }
}
