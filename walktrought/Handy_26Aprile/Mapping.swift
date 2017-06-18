////
////  StartController.swift
////  Handy_26Aprile
////
////  Created by Maurizio Lucci on 09/06/17.
////  Copyright © 2017 Federico Cattaneo. All rights reserved.
////
//
//import ObjectMapper
//
//
//class Item:  Mappable {
//    
//    var id          : Int?
//    var name        : String?
//    var description : String?
//    var price       : CGFloat?
//    var start_date  : CGFloat?
//    var end_date    : CGFloat?
//    var id_user     : [User]?
//    var id_category : Int?
//    
//    init() {}
//    
//    required init?(map: Map) {
//        
//    }
//    
//    func mapping(map: Map) {
//        
//        id          <- map["id"]
//        name        <- map["name"]
//        description <- map["description"]
//        price       <- map["price"]
//        start_date  <- map["start_date"]
//        end_date    <- map["end_date"]
//        id_user     <- map["id_user"]
//        id_category <- map["id_category"]
//        
//        var dictionary: [String: CGFloat]?
//        dictionary <- map["id_user"]
//        id_user = dictionary?.map { return User(id: $0.value, name: $0.key, surname: $0.key, birth_date: $0.key, email: $0.key, phone_number: $0.key)! }
//    }
//}
//
//class User {
//    
//    var id          : CGFloat?
//    var name        : String?
//    var surname     : String?
//    var birth_date  : String?
//    var email       : String?
//    var phone_number: String?
//    
//    init() {}
//    
//    required init?(id: CGFloat?, name: String?, surname: String?, birth_date: String?, email: String?, phone_number: String?) {
//        self.id           = id
//        self.name         = name
//        self.surname      = surname
//        self.birth_date   = birth_date
//        self.email        = email
//        self.phone_number = phone_number
//    }
//    
//    func mapping(map: Map) {
//        
//        id<-map["id"]
//        name<-map["name"]
//        surname<-map["surname"]
//        birth_date<-map["birth_date"]
//        email<-map["email"]
//        phone_number<-map["phone_number"]
//        
//        print("It json\(phone_number!)")
//    }
//}
