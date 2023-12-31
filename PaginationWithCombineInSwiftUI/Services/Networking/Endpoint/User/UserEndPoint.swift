//
//  UserEndPoint.swift
//  PaginationWithCombineInSwiftUI
//
//  Created by Blashko Maksym on 13.03.2023.
//

import Foundation

enum UserEndPoint: EndPointType {
    case getUsers(results: String, page: String)
}

extension UserEndPoint {
    var baseURL: URL {
        guard let url = URL(string: APIConstants.baseURL) else {
            fatalError("failed to configure base URL")
        }
        return url
    }
    var path: String {
        switch self {
        case .getUsers(let results, let page):
            return APIConstants.resultsPath + results + APIConstants.pagePath + page
        }
    }
    var httpMethod: HTTPMethod { .get }
    var task: HTTPTask { .request }
    var headers: HTTPHeaders? { nil }
}
