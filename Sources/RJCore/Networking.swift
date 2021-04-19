//
//  Networking.swift
//  RJCore
//
//  Created by Rahul Joshi on 4/18/21.
//

import Foundation

extension RJCore {
    public class Networking {
        /// Responsible for handling all networking calls
        /// - Warning: Must create befor using any public APIs
        public class Manager {
            public init() { }
            
            private let urlSession = URLSession.shared
            
            public func loadData(from url: URL, completionHandler: @escaping (NetworkResult<Data>) -> Void) {
                let task = urlSession.dataTask(with: url) { (data, response, error) in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
                task.resume()
            }
        }
        
        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
    }
}
