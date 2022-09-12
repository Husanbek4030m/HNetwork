//
//  ContentView.swift
//  HNetwork
//
//  Created by Karavella on 12/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var getAllState = "New"
    @State var getSingleState = "New"
    @State var postCreateState = "New"
    @State var putUpdateState = "New"
    @State var delDeleteState = "New"
    
   
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20) {
                Button {
                    self.getAllState = "Waiting..."
                    self.apiListAll()
                } label: {
                    Text("Get all employees (status: \(self.getAllState))")
                }
                
                
                Button {
                    self.getSingleState = "Waiting..."
                    self.apiSingleEmployee(id: 21)
                } label: {
                    Text("Get Single employee (status: \(self.getSingleState))")
                }
                
                
                
                Button {
                    self.postCreateState = "Waiting..."
                    self.apiCreateEmployee(emp: Employee(id: 1, name: "test", salary: 1200, age: 20, image: ""))
                } label: {
                    Text("Create employee (status: \(self.postCreateState))")
                }
                
                
                Button {
                    self.putUpdateState = "Waiting..."
                    self.apiUpdateEmployee(emp: Employee(id: 1, name: "test2", salary: 12200, age: 28, image: ""))
                } label: {
                    Text("Update employee (status: \(self.putUpdateState))")
                }
                
                
                
                Button {
                    self.delDeleteState = "Waiting..."
                    self.apiDeleteEmployee(id: 1)
                } label: {
                    Text("Delete employee (status: \(self.delDeleteState))")
                }

            }.navigationBarTitle("Network actions")
        }
        
        
    }
    
    func apiListAll() {
        AFHttp.get(url: AFHttp.API_EMPLOYEES_LIST, params: AFHttp.paramsEmpty()) { res in
            switch res.result {
            case .success:
                self.getAllState = "Success"
                print("---------\(res.result)")
            case let .failure(err):
                self.getAllState = "Error"
                print("---------\(err)")
                
            }
            
        }
    }
    
    func apiSingleEmployee(id: Int) {
        AFHttp.get(url: AFHttp.API_EMPLOYEE_SINGLE + String(id), params: AFHttp.paramsEmpty()) { res in
            switch res.result {
            case .success:
                self.getSingleState = "Success"
                print("---------\(res.result)")
            case let .failure(err):
                self.getSingleState = "Error"
                print("---------\(err)")
                
            }
        }
    }
    
    func apiCreateEmployee(emp: Employee) {
        AFHttp.post(url: AFHttp.API_EMPLOYEE_SINGLE, params: AFHttp.paramsCreate(emp: emp)) { res in
            switch res.result {
            case .success:
                self.postCreateState = "Success"
                print("---------\(res.result)")
            case let .failure(err):
                self.postCreateState = "Error"
                print("---------\(err)")
                
            }
        }
    }
    
    
    
    func apiUpdateEmployee(emp: Employee) {
        AFHttp.put(url: AFHttp.API_EMPLOYEE_SINGLE + String(emp.id!), params: AFHttp.paramsUpdate(emp: emp)) { res in
            switch res.result {
            case .success:
                self.putUpdateState = "Success"
                print("---------\(res.result)")
            case let .failure(err):
                self.putUpdateState = "Error"
                print("---------\(err)")
                
            }
        }
    }
    
    func apiDeleteEmployee(id: Int) {
        AFHttp.del(url: AFHttp.API_EMPLOYEE_SINGLE + String(id), params: AFHttp.paramsEmpty()) { res in
            switch res.result {
            case .success:
                self.delDeleteState = "Success"
                print("---------\(res.result)")
            case let .failure(err):
                self.delDeleteState = "Error"
                print("---------\(err)")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
