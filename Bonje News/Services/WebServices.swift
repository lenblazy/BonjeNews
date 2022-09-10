//
//  WebServices.swift
//  Bonje News
//
//  Created by LenoxBrown on 10/09/2022.
//

import Foundation

class WebService{
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let err = error{
                print(err)
                completion(nil)
            }
            
            if let safeData = data{
                do{
                    let articleList = try JSONDecoder().decode(ArticleList.self, from: safeData)
                    
                    completion(articleList.articles)
                    
                    print(articleList.articles)
                    
                }catch{
                    print(error)
                    completion(nil)
                }
                
            }
            
        }.resume()
        
    }
    
}
