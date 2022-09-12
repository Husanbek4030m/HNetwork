//
//  Employee.swift
//  HNetwork
//
//  Created by Karavella on 12/09/22.
//

import Foundation

struct Employee: Decodable {
    var id: Int?
    var name: String?
    var salary: Double?
    var age: Int?
    var image: String?
    
    
    init() {}
    
    
    init(id: Int, name: String, salary: Double?, age: Int, image: String) {
        self.id = id
        self.name = name
        self.salary = salary
        self.age = age
        self.image = image
        
    }
    
}
