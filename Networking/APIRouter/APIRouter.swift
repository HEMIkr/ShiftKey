//
//  APIRoute.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 10/11/2021.
//

import Foundation

public enum APIRouter {
    case getAvailableShifts(AvailableShiftsParameters)
}

extension APIRouter {
    private static let baseURLComponents: URLComponents? = {
        #if DEBUG
        return URLComponents(string: "https://staging-app.shiftkey.com/api/v2/") // Development server baseURL
        #else
        return URLComponents(string: "https://staging-app.shiftkey.com") // Production server baseURL
        #endif
    }()
    
    private var method: HTTPMethod {
        switch self {
        case .getAvailableShifts: return .get
        }
    }
    
    private var path: String {
        var path = "/api/v2/"
        switch self {
        case .getAvailableShifts: path.append("available_shifts")
        }
        return path
    }
    
    var asURLRequest: URLRequest? {
        guard var urlComponents = APIRouter.baseURLComponents else {
            assertionFailure()
            return nil
        }
        urlComponents.path = path
        
        switch self { // model cound paramterise request. In this demo-case we always call the same endpoint.
        case .getAvailableShifts(let requestModel):
            urlComponents.queryItems = requestModel.asQuerryItems
        }
        
        guard let url = urlComponents.url else {
            assertionFailure()
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
