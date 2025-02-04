//
//  NetworkError.swift
//  Sample
//
//  Created by Akash Mehta on 03/02/25.
//

import Foundation

enum NetworkError: Error {

  case badRequest
  case unauthorized
  case forbidden
  case notFound
  case requestTimeout
  case tooManyRequests

  case internalServerError
  case badGateway
  case serviceUnavailable
  case gatewayTimeout

  case decodingError(String?)
  case networkError(String?)
  case requestError(String?)

  static func fromStatusCode(_ statusCode: Int) -> NetworkError? {

    switch statusCode {

    case 400: return .badRequest
    case 401: return .unauthorized
    case 403: return .forbidden
    case 404: return .notFound
    case 408: return .requestTimeout
    case 429: return .tooManyRequests
    case 500: return .internalServerError
    case 502: return .badGateway
    case 503: return .serviceUnavailable
    case 504: return .gatewayTimeout
    default: return nil

    }

  }

}

// MARK: - LocalizedError

extension NetworkError: LocalizedError {

  var errorDescription: String? {

    switch self {

    case .badRequest:
      return "Bad Request (400): The server could not understand the request."

    case .unauthorized:
      return "Unauthorized (401): Authentication is required."

    case .forbidden:
      return "Forbidden (403): You don't have permission to access this resource."

    case .notFound:
      return "Not Found (404): The requested resource could not be found."

    case .requestTimeout:
      return "Request Timeout (408): The request took too long to complete."

    case .tooManyRequests:
      return "Too Many Requests (429): You have exceeded the allowed request limit."

    case .internalServerError:
      return "Internal Server Error (500): Something went wrong on the server."

    case .badGateway:
      return "Bad Gateway (502): The server received an invalid response from an upstream server."

    case .serviceUnavailable:
      return "Service Unavailable (503): The server is temporarily unavailable. Try again later."

    case .gatewayTimeout:
      return "Gateway Timeout (504): The server took too long to respond."

    case let .decodingError(message):
      return "Decoding Error: \(message ?? "Failed to decode response data.")"

    case let .networkError(message):
      return "Network Error: \(message ?? "Network request failed.")"

    case let .requestError(message):
      return "Request Error: \(message ?? "There was an issue with the request.")"

    }

  }
  
}
