//
//  RemoteAPIResponseHandler.swift
//  PaginationWithCombineInSwiftUI
//
//  Created by Blashko Maksym on 13.03.2023.
//

import Foundation

protocol RemoteAPIResponseHandler {
    func handleNetworkResponse(_ response: URLResponse?, data: Data?) -> Result<Void, Error>
}
