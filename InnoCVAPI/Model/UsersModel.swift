//
//  UsersModel.swift
//  InnoCVAPI
//
//  Created by Martin Cordoba on 25/9/22.
//

import Foundation
@MainActor

class UsersModel: ObservableObject {
    @Published var users: [User] = []
    let url = URL(string: "https://hello-world.innocv.com/api/User")!
    let urlSession = URLSession.shared
    
    func reload() async {
        
        do{
            let (data, _) = try! await urlSession.data(from: url)
            self.users = try JSONDecoder().decode([User].self, from: data)
        }
        catch {
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            debugPrint("Error loading \(url): \(String(describing: error))")
        }
    }
  
    func addNewUser(name: String, birthdate: String, id: Int){
        users.append(User(name: name, birthdate: birthdate, id: id))
        //urlSession.uploadTask(with: <#T##URLRequest#>, from: <#T##Data#>)
    }
    
}
