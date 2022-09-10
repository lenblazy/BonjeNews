//
//  Article.swift
//  Bonje News
//
//  Created by LenoxBrown on 10/09/2022.
//

import Foundation

struct ArticleList: Decodable{
    let articles: [Article]
}

struct Article: Decodable{
    let title: String
    let description: String?
}
