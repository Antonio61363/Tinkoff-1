//
//  ConversationCellConfigurationProtocol.swift
//  TinkoffAwsomeChat
//
//  Created by Антон on 25/02/2019.
//  Copyright © 2019 AntonChernyshev. All rights reserved.
//

import Foundation

protocol ConverastionCellConfiguration : class {
    var name: String? { get set }
    var message: String? { get set }
    var date: Date? { get set }
    var online: Bool { get set }
    var hasUnreadMessages: Bool { get set }
}
