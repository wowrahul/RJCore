//
//  Networking.swift
//  RJCore
//
//  Created by Rahul Joshi on 4/18/21.
//

import Foundation

protocol NetworkSession {
    func get(from url:URL, completionHandler: @escaping (Data?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: url) { data, _, error in
            completionHandler(data, error)
        }
        task.resume()
    }
}
extension RJCore {
    public class Networking {
        /// Responsible for handling all networking calls
        /// - Warning: Must create befor using any public APIs
        public class Manager {
            public init() { }
            
            internal var urlSession: NetworkSession = URLSession.shared
            
            /// Fetches data from the provided url
            /// - Parameters:
            ///   - url: The location you wish to fetch data from
            ///   - completionHandler: Returns a result object 
            public func loadData(from url: URL, completionHandler: @escaping (NetworkResult<Data>) -> Void) {
                urlSession.get(from: url) { (data, error) in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
            }
        }
        
        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
    }
}
