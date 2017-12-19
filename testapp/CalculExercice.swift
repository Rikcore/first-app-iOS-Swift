//
//  CalculExercice.swift
//  testapp
//
//  Created by Cyprien Chamayou on 16/12/2017.
//  Copyright © 2017 Cyprien Chamayou. All rights reserved.
//

import UIKit

class CalculExercice {
    var consigne : String
    var titre : String
    var reponse : Int
    
    init(difficulte : Int) {
        switch difficulte {
        case 2:
            
            consigne = "8 x 7"
            titre = "Niveau moyen"
            reponse = 56
            break
            
        default:
            
            consigne = "4 + 4"
            titre = "Niveau facile"
            reponse = 8
            break
            
        }
        
    }
    
    func fillTitle (label : UILabel){
        label.text = titre
    }
    
    
}
