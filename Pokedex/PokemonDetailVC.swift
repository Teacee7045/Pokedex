//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Thomas Chow on 26/01/2016.
//  Copyright © 2016 Paws. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    @IBOutlet var mainImg: UIImageView!
    @IBOutlet var currentEvoImg: UIImageView!
    @IBOutlet var nextEvoImg: UIImageView!
    @IBOutlet var evoLbl: UILabel!
    @IBOutlet var attackLbl: UILabel!
    @IBOutlet var weightLbl: UILabel!
    @IBOutlet var pokedexLbl: UILabel!
    @IBOutlet var heightLbl: UILabel!
    @IBOutlet var defenseLbl: UILabel!
    @IBOutlet var typeLbl: UILabel!
    @IBOutlet var descriptionLbl: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        
        //THIS WILL BE CALLED AFTER DOWNLOAD IS DONE
        pokemon.downloadPokemonDetails { () -> () in
            self.updateUI()
        }
    }
    
    func updateUI() {
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        attackLbl.text = pokemon.attack
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        if pokemon.nextEvoId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvoId)
            var str = "Next Evolution: \(pokemon.nextEvoTxt)"
            
            if pokemon.nextEvoLvl != "" {
                str += " - LVL \(pokemon.nextEvoLvl)"
                
            evoLbl.text = str
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedBackBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


    
    
}
