import Foundation

enum RouteError: Error {
    case InvalidURL
}

protocol InteractsWithServer {
    
    associatedtype ExpectedResponseModelType: Decodable
    
    var url: String { get }
    
    var apiKey: String { get }
    
    func prepareURL() throws -> URL
  
}


extension InteractsWithServer {
    
    var url: String {
        return "https://api.omdb.com"
    }
    
    func prepareUrl() throws -> URL {
        
        guard let apiURL = URL(string: self.url) else {
            throw RouteError.InvalidURL
        }
        
        return apiURL
    }
  
}

