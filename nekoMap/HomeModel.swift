//
//  HomeModel.swift
//  
//
//  Created by jinikuadmin on 3/10/17.
//
//

import Foundation

protocol HomeModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocal!
    
    var data : NSMutableData = NSMutableData()
    
    let urlPath: String = "https://nekomap.000webhostapp.com/service2.php"

    func downloadItems() {
        
        let url: NSURL = NSURL(string: urlPath)!
        var session: URLSession!
        let configuration = URLSessionConfiguration.default
        
        
        session = {
            let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
            return session}()
        
        let task = session.dataTask(with: url as URL)
        
        task.resume()
        
    }
    
    func URLSession(session: URLSession, dataTask: URLSessionDataTask, didReceiveData data: NSData) {
        self.data.append(data as Data);
        
    }
    
    func URLSession(session: URLSession, task: URLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil {
            print("Failed to download data")
        }else {
            print("Data downloaded")
            self.parseJSON()
        }
        
    }
    
    func parseJSON() {
        
        var jsonResult: NSMutableArray = NSMutableArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: self.data as Data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSMutableArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let locations: NSMutableArray = NSMutableArray()
        
        for i in (0 ..< jsonResult.count)
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let location = LocationModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let animal = jsonElement["animal"] as? String,
                let city = jsonElement["city"] as? String,
                let name = jsonElement["name"] as? String,
                let googleplaceid = jsonElement["googleplaceid"] as? String
            {
                
                location.animal = animal
                location.city = city
                location.name = name
                location.googleplaceid = googleplaceid
                
            }
            
            locations.add(location)
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.delegate.itemsDownloaded(locations)
            
        })
    }
}

