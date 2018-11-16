//
//  NewsListTableViewCell.swift
//  newsapp-alamofire
//
//  Created by Ridho Pratama on 15/11/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import UIKit
import Alamofire

class NewsListTableViewCell: UITableViewCell {

    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindWith(article: Article) {
        newsTitleLabel.text = article.title
        
        //NOTE: A way to load image from URL
        if let imageUrl = article.urlToImage {
            Alamofire.request(imageUrl).responseData{ (response) in
                guard let data = response.data,
                    let image = UIImage(data: data) else {
                        return
                }
                self.newsImageView.image = image
            }
        }
    }

}
