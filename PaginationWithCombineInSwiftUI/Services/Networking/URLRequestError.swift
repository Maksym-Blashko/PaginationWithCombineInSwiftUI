//
//  URLRequestError.swift
//  PaginationWithCombineInSwiftUI
//
//  Created by Blashko Maksym on 13.03.2023.
//

import Foundation

enum URLRequestError: Error {
    case badRequest
    case internalServerError
    case outdated
    case unknown
}
