//
//  ViewController.swift
//  CollectionViewPrefetch
//
//  Created by Jakkawad Chaiplee on 5/15/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching {

    var dataArray: [String] = []
    var receivedData: [String] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell0 = collectionView.dequeueReusableCell(withReuseIdentifier: "tableCell0", for: indexPath) as? CustomCollectionViewCell
        cell0?.lblName.text = dataArray[indexPath.row]
        return cell0!
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let obj = self.receivedData[indexPath.row] as String
            self.dataArray[indexPath.row] = obj as String
            print("update upcoming \(self.dataArray[indexPath.row])")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        print("cancel prefetch iten")
        for indexPath in indexPaths {
            self.dataArray.remove(at: indexPath.row)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: (screenWidth/3)-6, height: (screenWidth/3)-6)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        receivedData = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"]
        dataArray = receivedData
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

