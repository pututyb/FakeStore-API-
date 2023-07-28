//
//  API.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 28/07/23.
//

import Foundation

class API {
    static func fetchDataFromAPI(completion: @escaping (Result<[Welcome], Error>) -> Void) {
        guard let url = URL(string: "https://fakestoreapi.com/users") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([Welcome].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
