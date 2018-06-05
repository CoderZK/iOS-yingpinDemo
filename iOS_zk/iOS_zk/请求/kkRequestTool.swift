//
//  kkRequestTool.swift
//  iOS_zk
//
//  Created by kunzhang on 2018/6/5.
//  Copyright © 2018年 kunzhang. All rights reserved.
//

import UIKit

class kkRequestTool: NSObject {

    //单利,请求的单利
    static let instace : AFHTTPSessionManager =  AFHTTPSessionManager()
    private class func share() -> AFHTTPSessionManager {
        instace.responseSerializer.acceptableContentTypes?.insert("text/plain")
        instace.responseSerializer.acceptableContentTypes?.insert("application/json")
        instace.responseSerializer.acceptableContentTypes?.insert("text/html")
        instace.responseSerializer.acceptableContentTypes?.insert("text/json")
        instace.responseSerializer.acceptableContentTypes?.insert("text/javascript")
        instace.requestSerializer.setValue("http://iosapi.jkcsoft.com/public/index.html", forHTTPHeaderField: "Referer")
        return instace
    }
    
    //回调
    typealias resultBlock = (_ result: Any?,_ key:Int? ,_ message:String? ,_ error:Error?) ->Void
    
    // get
    class  func GETRequestWithUrlstringAndDict(url:String ,params:[String:Any?] ,result:resultBlock?) -> (){
    

        kkRequestTool.share().get(url, parameters: params, progress: nil, success: { (task: URLSessionDataTask, responseObj: Any?) in
            
                result!(responseObj,1,"123",nil)
  
        }, failure: { (task: URLSessionDataTask?, error: Error) in
           
            result!(nil,nil,nil,error)
        })
        
    }
    
    
    //post 请求
    class  func POSTRequestWithUrlstringAndDict(url:String ,params:[String:Any?] ,result:resultBlock?) -> (){

        kkRequestTool.share().post(url, parameters: params, progress: nil, success: { (task: URLSessionDataTask, responseObj: Any?) in
            
            if let item = responseObj as? Dictionary<String ,Any> {
                let key : Int = item["key"] as! Int
                let message = item["message"] as! String
                result!(item["result"] as Any ,key,message,nil)
            }else {
                result!(nil,100,"失败---",nil)
            }
        }, failure: { (task: URLSessionDataTask?, error: Error) in
           
            result!(nil,nil,nil,error)
        })
        
    }
    
}
