//
//  JSONParameterEncoder.swift
//  PaginationWithCombineInSwiftUI
//
//  Created by Blashko Maksym on 13.03.2023.
//

import Foundation

struct JSONParameterEncoder: ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
