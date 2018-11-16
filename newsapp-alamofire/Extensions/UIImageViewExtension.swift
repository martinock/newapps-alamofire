//
//  UIImageViewExtension.swift
//  newsapp-alamofire
//
//  Created by Nakama on 16/11/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import Alamofire
import UIKit

//NOTE: A way to remove boilerplate code when handling image response
extension UIImageView {
    func loadImageFrom(url: URL?) {
        if let imageUrl = url {
            Alamofire.request(imageUrl).responseData{(response) in
                guard let data = response.data,
                    let image = UIImage(data: data) else {
                        return
                }
                
                self.image = image
            }
        }
    }
}
