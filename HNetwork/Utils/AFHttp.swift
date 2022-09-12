//
//  AFHttp.swift
//  HNetwork
//
//  Created by Karavella on 12/09/22.
//

import Foundation
import Alamofire

private let IS_TESTER = true
private let DEP_SERVER = "https://dummy.restapiexample.com/api/v1/"
private let DEV_SERVER = "https://dummy.restapiexample.com/api/v1/"

let headers: HTTPHeaders = [
]

class AFHttp {
    class func get(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .get, parameters: params, headers: headers)
            .validate().responseJSON(completionHandler: handler)
    }
    
    
    class func post(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .post, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func put(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .put, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func del(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .delete, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func server(url: String) -> URL {
        if(IS_TESTER) {
            return URL(string: DEV_SERVER + url)!
        }
        return URL(string: DEP_SERVER + url)!
    }
    
    
    //MARK : - apilar
    static let API_EMPLOYEES_LIST = "employees"
    static let API_EMPLOYEE_SINGLE = "employees/" //:id
    static let API_EMPLOYE_CREATE = "create"
    static let API_EMPLOYE_UPDATE = "update/" //:id
    static let API_EMPLOYE_DELETE = "delete/" //:id
    
    // MARK : - Paramslar
    
    class func paramsEmpty() -> Parameters {
        let par: Parameters = [:]
        return par
    }
    
    class func paramsCreate(emp: Employee) -> Parameters {
        let par : Parameters = [
            "name": emp.name!,
            "salary": emp.salary!,
            "age": String(emp.age!)
        ]
        
        return par
    }
    
    
    class func paramsUpdate(emp: Employee) -> Parameters {
        let par : Parameters = [
                "name": emp.name!,
                "salary": emp.salary!,
                "age": String(emp.age!)
        ]
        
        return par
    }
    
}
