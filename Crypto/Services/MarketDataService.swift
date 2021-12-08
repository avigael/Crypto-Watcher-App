//
//  MarketDataService.swift
//  Crypto
//
//  Created by Gael G. on 12/3/21.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketInfo?
    
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {
            print("Invalid URL")
            return
        }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] returnData in
                self?.marketData = returnData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
