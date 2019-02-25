//
//  Users.swift
//  TinkoffAwsomeChat
//
//  Created by Антон on 25/02/2019.
//  Copyright © 2019 AntonChernyshev. All rights reserved.
//

import Foundation

class Users: ConverastionCellConfiguration {
    
    var name: String?
    
    var message: String?
    
    var date: Date?
    
    var online: Bool
    
    var hasUnreadMessages: Bool
    
    var isReuse: Bool
    
    init(name: String?, message: String?, date: Date?, online: Bool, hasUnreadMessage: Bool) {
        self.name = name
        self.message = message
        self.date = date
        self.online = online
        self.hasUnreadMessages = hasUnreadMessage
        self.isReuse = false
    }
}
