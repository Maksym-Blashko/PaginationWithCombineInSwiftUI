//
//  OSLogs.swift
//  PaginationWithCombineInSwiftUI
//
//  Created by Blashko Maksym on 13.03.2023.
//

import Foundation
import os.log

enum LogCategory: String {
    case userSession = "[UserSession]"
    case network = "[Network]"
}

extension OSLog {
    private static var subsystem: String { Bundle.main.bundleIdentifier ?? "" }
    // MARK: Logs
    static let userSession = OSLog(subsystem: subsystem, category: LogCategory.userSession.rawValue)
    static let network = OSLog(subsystem: subsystem, category: LogCategory.network.rawValue)
}
