//
//  NewsListViewController.swift
//  newsapp-alamofire
//
//  Created by Ridho Pratama on 15/11/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import UIKit
import Alamofire

class NewsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadDataFromAPI()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadDataFromAPI() {
        let jsonDecoder = JSONDecoder()
        
        Alamofire
            .request("https://newsapi.org/v2/everything?q=bitcoin&from=2018-10-16&sortBy=publishedAt&apiKey=72fbf5e64b3448d2a8ebbb71fc9dba7f")
            .responseJSON{(response) in
                guard let responseData = response.data else {return}
                
                //NOTE: Error handling for API response. No need to use "?" when on do block
                do {
                    let mappedResponse = try jsonDecoder.decode(ArticleResponse.self, from: responseData)
                    
                    self.articles = mappedResponse.articles
                    
                    //NOTE: When reload data, the system will run everything on UITableViewDataSource
                    self.tableView.reloadData()
                } catch (let error) {
                    print(error)
                }
                
        }
    }
    
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // didSelect
    }
}

extension NewsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: indexPath) as? NewsListTableViewCell else {
            fatalError("Expected cell type is NewsListTableViewCell")
        }
        
        cell.bindWith(article: articles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
}
