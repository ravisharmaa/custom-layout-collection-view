import Foundation

protocol InteractsWithServer {
    
    associatedtype ExpectedResponseModelType: Decodable
    
    var url: URL { get set}
  
}



