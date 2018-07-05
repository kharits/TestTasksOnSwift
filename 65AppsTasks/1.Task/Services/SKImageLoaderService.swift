//
//  SKImageLoaderService.swift
//  65AppsTasks
//
//  Created by Sergey Kharitonov on 03.07.2018.
//  Copyright © 2018 Sergey Kharitonov. All rights reserved.
//

import UIKit

class SKImageLoaderService: NSObject {

    func downloadImage(withURL url:URL, callback:@escaping (UIImage?, NSError?) -> Void) {
        
        let session = URLSession.shared;
        let request = NSMutableURLRequest(url: url);
        let task = session.dataTask(with: request as URLRequest){
            (data, response, error) -> Void in
            if error != nil {
                callback(nil, error! as NSError);
            } else {
                callback(UIImage.init(data: data!), nil);
            }
        }
        task.resume();
    }
    
}
