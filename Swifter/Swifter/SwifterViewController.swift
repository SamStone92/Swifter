//
//  ViewController.swift
//  Swifter
//
//  Created by Sam Stone on 14/10/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

import UIKit
import TwitterKit
import Fabric


class SwifterViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView();
       
        
        
    }
    
    func setupCollectionView(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout();
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10);
        layout.itemSize = CGSize(width: self.view.frame.width-20, height: 90);
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout:layout);
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell");
        collectionView.backgroundColor = UIColor.whiteColor();
        self.view.addSubview(collectionView);
        
        Fabric.with([Twitter.self])
        
        let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
        let params = ["screen_name": "stonesam92", "count": "10"]
        var clientError = NSError?()
        
        do {
            let request = Twitter.sharedInstance().APIClient.URLRequestWithMethod("GET", URL: statusesShowEndpoint, parameters: params, error: &clientError)
            
            
            Twitter.sharedInstance().APIClient.sendTwitterRequest(request) {
                (response, data, connectionError) -> Void in
                if (connectionError == nil) {
                    
                    do {
                        
                        let feeddata = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSArray
                       
                        let feedcount = feeddata.count
                        
                        
                        for var i = 0; i < feedcount; i++ {
                            
                           
                            
                        }
                    } catch {
                        
                    }
                }else {
                    print("Error: \(connectionError)")
                    
                }
            }
        } 
        
    
        
        

        
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 14
        
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) ;
        cell.backgroundColor = UIColor.orangeColor();

        return cell
    }


}

