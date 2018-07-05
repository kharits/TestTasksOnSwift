#!/usr/bin/env xcrun swift -F Carthage/Build/Mac

import Foundation
import Alamofire

print("Hello, World!")

if CommandLine.argc < 2 {
    print("No arguments are passed.")
} else {
    let nickname = CommandLine.arguments[1]
    print(nickname)
    Alamofire.request("https://api.github.com/users/\(nickname)/repos").validate().responseJSON { response in
        switch response.result {
        case .success:
            let jsonArray = response.result.value as! NSArray
            for buf:Any in jsonArray {
                let dict = buf as! NSDictionary
                print("\(dict["name"] as! String)")
                
            }
        case .failure(let error):
            print(error)
        }
        exit(EXIT_SUCCESS)
    }
}

dispatchMain()
