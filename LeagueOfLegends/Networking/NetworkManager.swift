//
//  NetworkManager.swift
//  LeagueOfLegends
//
//  Created by Hollis Kwan on 10/8/22.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    let baseUrl = URL(string: "https://raw.githubusercontent.com")
    let endPoint = "ngryman/lol-champions/master/champions.json"
    
    func fetchChampionData(completion: @escaping ([ChampionsAPIModel]) -> Void) {
        
        guard let url = baseUrl?.appending(path: endPoint) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
            
            if let error = error {
                print("Error Fetching Champion Data. Error: \(error)")
                return
            }
            
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode([ChampionsAPIModel].self, from: data)
                    completion(jsonData)
                } catch {
                    print("Error Decoding Champion JSON. Error: \(error)")
                }
            }
        }).resume()
    }
    
    func fetchImage(with url: URL, completion: @escaping (Data) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
            if let error = error {
                print("Error Fetching Image. Error: \(error)")
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }).resume()
    }
}
