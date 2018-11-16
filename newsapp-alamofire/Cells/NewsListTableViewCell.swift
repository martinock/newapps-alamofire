//
//  NewsListTableViewCell.swift
//  newsapp-alamofire
//
//  Created by Ridho Pratama on 15/11/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import UIKit

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
    }

}
