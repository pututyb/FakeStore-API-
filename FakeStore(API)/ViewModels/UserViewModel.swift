//
//  UserViewModel.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 28/07/23.
//

import Foundation

class UserViewModel{
    
    private let apiURL = "https://fakestoreapi.com/users"
    private var users: [Welcome] = []
    
    func fetchUsers(completion: @escaping ([Welcome]) -> Void) {
        guard let url = URL(string: apiURL) else {
            print("Invalid URL \(apiURL)")
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error Fetchin Users \(error)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion([])
                return
            }
            
            do {
                let users = try JSONDecoder().decode([Welcome].self, from: data)
                self.users = users
                completion(users)
            } catch {
                print("error decoding users \(error)")
                completion([])
            }
        }.resume()
    }
    
    func getUser(at index: Int) -> Welcome? {
        guard index >= 0, index < users.count else {
            return nil
        }
        return nil
    }
    
    func checkLogin(username: String, password: String) -> Bool {
        return users.contains { user in
            user.username == username && user.password == password
        }
    }
}
