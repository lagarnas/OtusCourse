//
//  ServiceLocator.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 05.07.2024.
//

import Foundation

// 1. Создать ServiceLocator (можно на дженериках)

class ServiceLocator : NSObject {
    private var containerServices = [String: AnyObject]()
    
    func addService<T:AnyObject>(service: T) {
        let key = "\(T.self)"
        if containerServices[key] == nil {
            containerServices[key] = service
        }
    }
    
    func getService<T:AnyObject>(type: T.Type)->T? {
        let key = "\(T.self)"
        return containerServices[key] as? T
    }
}
