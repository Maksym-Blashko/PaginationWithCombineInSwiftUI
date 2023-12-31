//
//  NetworkRouter.swift
//  PaginationWithCombineInSwiftUI
//
//  Created by Blashko Maksym on 13.03.2023.
//

import Foundation

protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
    @discardableResult
    func request<T: Decodable>(_ route: EndPoint, responseHandler: RemoteAPIResponseHandler?, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionTask?
    func cancel()
}
