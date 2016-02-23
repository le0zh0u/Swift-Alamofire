//
//  ViewController.swift
//  Swift Alamofire
//
//  Created by 周椿杰 on 16/2/22.
//  Copyright © 2016年 周椿杰. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        useAlamofire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func useAlamofire(){
        
        //Response结果处理
        Alamofire.request(.GET, "http://httpbin.org/get", parameters:["foo":"bar"])
            .response{(request,response,data,error) in
                print(request)
                print("\n")
                print(response)
                print("\n")
                print(error)
        }
        
        //Response结果字符串处理
        Alamofire.request(.GET, "http://httpbin.org/get", parameters:["foo":"bar"])
            .response{
                (request,response,string,error)in
               // print(string)
        }
        
        //Response JSON
        Alamofire.request(.GET, "http://httpbin.org/get").responseJSON{
            response in
            if response.result.isSuccess {
                print(response)
            }
        }
        
        //POST JSON格式数据
        let parameters = ["foo":"bar"]
        Alamofire.request(.POST, "http://httpbin.org/post", parameters:parameters, encoding: .JSON).response{(request,response,JSON,error) in
                print(JSON)
        }
    }


}

