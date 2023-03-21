//
//  Extensions.swift
//  MoviesApp
//
//  Created by Amaal Almutairi on 29/08/1444 AH.
//

import Foundation
import UIKit


extension String {
func toImage() -> UIImage? {
if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
return UIImage(data: data)
}
return nil
}
}
