//
//  MyModel.swift
//  MyApiAppFirst23-12-22
//
//  Created by Bharat Silavat on 23/12/22.
//

import Foundation

struct LargeArchieve: Codable {
    
    var created : Int?
    var d1:String?
    var d2:String?
    var dir : String?
    var files : [myFiles]?
    var fileCOunt:Int?
    var itemLastUpdated:Int?
    var itemSize : Int?
    var metaData : [myMetaData]?
    
    
    
    enum CodingKey: String, CodingKey {
        
        case created
        case d1
        case d2
        case dir
        case files
        case fileCOunt
        case itemLastUpdated
        case itemSize
        case metaData
    
    }
  
}
    
    
    struct myFiles:Codable {
        
        var name : String?
        var source : String?
        var format : String?
        var original : String?
        var mtime : String?
        var size : String?
        var md5 : String?
        var crc32 : String?
        var shal : String?
        
        
        
        
    }
    
    struct myMetaData:Codable{
        
        var identifier : String?
        var mediaType: String?
        var description:String?
        var language:String?
        var scanner : String?
        var tittle: String?
        var publicDate:String?
        var uploader:String?
        var addedDate:String?
        var identifierAccess:String?
        var identifier_ark:String?
        var ppi:String?
        var ocr:String?
        var repub_state:String?
        var creater:String?
        var subject : [String]?
        var curation : [String]?
        var collection : [String]?
        
        
        
    }
    
    
