//
//  NewsVC.swift
//  Bonje News
//
//  Created by LenoxBrown on 10/09/2022.
//

import Foundation
import UIKit

class NewsTableViewController: UITableViewController{
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        if let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-08-10&sortBy=publishedAt&apiKey=da18f6f7abae4139b8c88f5b0d17b73e"){
            
            WebService().getArticles(url: url) { articles in
                if let articles = articles {
                    self.articleListVM = ArticleListViewModel(articles: articles)
                    //
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! ArticleTableViewCell
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
    
}
