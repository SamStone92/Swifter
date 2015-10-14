//
//  ViewController.swift
//  Swifter
//
//  Created by Sam Stone on 14/10/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

import UIKit

class SwifterViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView();
    }
    
    func setupCollectionView(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout();
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10);
        layout.itemSize = CGSize(width: 90, height: 90);
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout:layout);
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell");
        collectionView.backgroundColor = UIColor.whiteColor();
        self.view.addSubview(collectionView);
        
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 14
        
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell;
        cell.backgroundColor = UIColor.orangeColor();

        return cell
    }


}

