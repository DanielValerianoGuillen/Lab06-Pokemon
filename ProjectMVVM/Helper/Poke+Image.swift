//
//  Poke+Image.swift
//  ProjectMVVM
//
//  Created by MAC17 on 23/04/22.
//

import Foundation
import UIKit

class HelperImage{
    static func setImage(id:String)-> UIImage?{
        return convertImageFromURL(url: getUrlImage(id: id))
    }
    
    static func setImageFromUrl(url: String) -> UIImage? {
        return convertImageFromURL(url: url)
    }
    
    static func convertImageFromURL(url: String) -> UIImage? {
        let data = try? Data(contentsOf: HelperString.getURLFromString(url: url)!)
        if let imageData = data{
          return UIImage(data: imageData)
        }
        return nil    }
    
    static func getUrlImage(id:String)-> String{
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
        
    }
}
