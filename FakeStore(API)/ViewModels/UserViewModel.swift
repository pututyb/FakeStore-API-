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
    
    func createUser(username: String, password: String, email: String, firstName: String, lastName: String, phone: String, completion: @escaping (Bool) -> Void) {
            // Create the user object with the provided data
            let user = Welcome(
                id: 0, // You can leave this as 0, assuming the server assigns an ID
                email: email,
                username: username,
                password: password,
                address: Address(city: "", street: "", number: 0, zipcode: ""), // You can provide relevant address data
                name: Name(firstname: firstName, lastname: lastName),
                phone: phone
            )

            // Convert the user object to JSON data
            guard let jsonData = try? JSONEncoder().encode(user) else {
                print("Failed to encode user data")
                completion(false)
                return
            }

            // Prepare the URLRequest to send the user data to the server
            guard let url = URL(string: apiURL) else {
                print("Invalid URL \(apiURL)")
                completion(false)
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData

            // Send the user data to the server
            URLSession.shared.dataTask(with: request) { _, response, error in
                if let error = error {
                    print("Error creating user: \(error)")
                    completion(false)
                    return
                }

                // Check the server response (you may need to handle different status codes)
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    // User created successfully
                    completion(true)
                } else {
                    print("Failed to create user. Server responded with an error.")
                    completion(false)
                }
            }.resume()
        }
    
    
    func checkLogin(username: String, password: String) -> Bool {
        return users.contains { user in
            user.username == username && user.password == password
        }
    }
}
