//
//  PokeDetailViewController.swift
//  ProjectMVVM
//
//  Created by MAC35 on 29/04/22.
//

import UIKit

class PokeDetailViewController: UIViewController {
    
    //vamos a declarar que variable necesitamos
    var url: String = ""
    var pokemon: PokeDetail? = nil
    	
    let pokeViewModel: PokeViewModel = PokeViewModel()
    
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var lblNamePokemon: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await setUpView()
        }
    }
    func setUpView() async {
        await pokeViewModel.getPokeDetail(url: url)
        pokemon = pokeViewModel.pokemon
        setUpPokeData()
    }
    
    func setUpPokeData() {
        view.backgroundColor = PokeTypes.types[(pokemon?.types[0].type.name)!]
        lblNamePokemon.text = pokemon?.name.capitalized
        lblType.text = pokemon?.types[0].type.name ?? ""
        imagePokemon.image = HelperImage.setImageFromUrl(url: (pokemon?.sprites.other.officialArtwork.front_default)!)
    }
}
