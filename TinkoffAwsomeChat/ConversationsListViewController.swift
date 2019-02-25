//
//  ConversationsListViewController.swift
//  TinkoffAwsomeChat
//
//  Created by Антон on 25/02/2019.
//  Copyright © 2019 AntonChernyshev. All rights reserved.
//

import UIKit

class ConversationsListViewController: UITableViewController {
    
    let users = [Users(name: "Алена", message: "Познакомимся?", date: Calendar.current.date(byAdding: Calendar.Component.day,   value: -1, to: Date()), online: true, hasUnreadMessage: false),
                 Users(name: "Катя", message: "Привет, как дела?", date: Date(), online: true, hasUnreadMessage: true),
                 Users(name: "Дима", message: "Го бухать", date: Date(), online: true, hasUnreadMessage: true),
                 Users(name: "Тинькофф", message: "Оформи карту", date: Date(), online: true, hasUnreadMessage: true),
                 Users(name: "Гарольд", message: "Страдай", date: Date(), online: true, hasUnreadMessage: false),
                 Users(name: "Саня", message: "iOS для лохов, android топчик", date: Calendar.current.date(byAdding: Calendar.Component.day, value: -2, to: Date()), online: true, hasUnreadMessage: false),
                 Users(name: "Начальник", message: "Завтра на работу", date: Date(), online: true, hasUnreadMessage: true),
                 Users(name: "Тот чувак из бара", message: "Ты мне сотку должен", date: Date(), online: true, hasUnreadMessage: true),
                 Users(name: "Море", message: "Куда ты пропал?", date: Calendar.current.date(byAdding: Calendar.Component.day, value: -4, to: Date()), online: false, hasUnreadMessage: false),
                 Users(name: "Я", message: nil, date: Date(), online: true, hasUnreadMessage: false)]
    
    var onlineUsers = [Users]()
    var oflineUsers = [Users]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        onlineUsers = users.filter { user -> Bool in
            return user.online
        }
        
        oflineUsers = users.filter { user -> Bool in
            return !user.online
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        switch section {
        case 0:
            count = onlineUsers.count
        case 1:
            count = oflineUsers.count
        default: break
        }
        return count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var text = ""
        switch section {
        case 0:
            text = "Online"
        case 1:
            text = "History"
        default:
            break
        }
        return text
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell", for: indexPath) as! ConversationTableViewCell
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMM"
        
        
        let dayNow = Calendar.current.dateComponents([.day], from: Date())
        
        
        switch indexPath.section {
        case 0:
            
            let currentDay = Calendar.current.dateComponents([.day], from: onlineUsers[indexPath.row].date ?? Date())
            if dayNow == currentDay {
                dateFormater.dateFormat = "HH:mm"
            }
            
            cell.backgroundColor = .yellow
            cell.nameLabel.text = onlineUsers[indexPath.row].name ?? "name"
            
            if onlineUsers[indexPath.row].message == nil {
                cell.lastMessageLabel.text = "No messages yet"
                cell.lastMessageLabel.font = UIFont(name: "Bodoni Ornaments", size: 17)
            } else {
                cell.lastMessageLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 17)
                cell.lastMessageLabel.text = onlineUsers[indexPath.row].message
            }
            cell.timeOfLastMessageLabel.text = dateFormater.string(from: onlineUsers[indexPath.row].date ?? Date())
            
            
            if onlineUsers[indexPath.row].hasUnreadMessages {
                cell.lastMessageLabel.font = UIFont.boldSystemFont(ofSize: 17)
            } else {
                cell.lastMessageLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            }
            
        case 1:
            
            let currentDay = Calendar.current.dateComponents([.day], from: oflineUsers[indexPath.row].date ?? Date())
            if dayNow == currentDay {
                dateFormater.dateFormat = "HH:mm"
            }
            
            cell.backgroundColor = .white
            cell.nameLabel.text = oflineUsers[indexPath.row].name ?? "name"
            cell.lastMessageLabel.text = oflineUsers[indexPath.row].message ?? "No messages yet"
            cell.timeOfLastMessageLabel.text = dateFormater.string(from: oflineUsers[indexPath.row].date ?? Date())
            
            if oflineUsers[indexPath.row].hasUnreadMessages {
                cell.lastMessageLabel.font = UIFont.boldSystemFont(ofSize: 17)
            } else {
                cell.lastMessageLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            }
            
        default:
            break
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToConversation" else { return }
        let destinationVc = segue.destination
        if let selectIndex = self.tableView.indexPathForSelectedRow {
            switch selectIndex.section {
            case 0:
                destinationVc.title = onlineUsers[selectIndex.row].name
            case 1:
                destinationVc.title = oflineUsers[selectIndex.row].name
            default:
                break
            }
            
        }
        
    }
    
    
}
