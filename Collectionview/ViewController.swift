//
//  ViewController.swift
//  Collectionview
//
//  Created by Meghna on 04/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    var arrData = ["class 1","class 1","class 1","class 1","class 1","class 1","class 1","class 1"] // This is your data array
    var arrSelectedIndex = [IndexPath]() // This is selected cell Index array
    var arrSelectedData = [String]()
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    //    let reuseIdentifier = "cell"
    //        var items = ["student","student","student","student","student"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registationCell()
        collectionview.allowsMultipleSelection = true
        
        
        //        let layout = UICollectionViewFlowLayout()
        //        layout.scrollDirection = .vertical //.horizontal
        //        layout.minimumLineSpacing = 5
        //        layout.minimumInteritemSpacing = 5
        //        collectionview.setCollectionViewLayout(layout, animated: true)
        
    }
}
extension ViewController{
    func registationCell(){
        self.collectionview.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
    }
}
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionview.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        //cell.lblName.text = "bla bla" //access your Cell's IBOutlets
        return cell
        
        
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("Selected Cell: \(indexPath.row)")
        
        //        let items = collectionview.indexPathsForSelectedItems
        //print(items)
        let strData = arrData[indexPath.item]
        
        if arrSelectedIndex.contains(indexPath) {
            arrSelectedIndex = arrSelectedIndex.filter { $0 != indexPath}
            arrSelectedData = arrSelectedData.filter { $0 != strData}
        }
        else {
            arrSelectedIndex.append(indexPath)
            arrSelectedData.append(strData)
            
        }
        print("arrSelectedIndex",arrSelectedIndex)
        print("arrSelectedData",arrSelectedData)
        collectionView.reloadData()
    }
    
    
    //    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    //        let cell = collectionView.cellForItem(at: indexPath)
    //        cell?.backgroundColor = UIColor.red
    //    }
    
    // change background color back when user releases touch
    //    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    //        let cell = collectionView.cellForItem(at: indexPath)
    //        //cell?.backgroundColor = UIColor.cyan
    //    }
    
    
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//               let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
//               let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
//               let size:CGFloat = (collectionview.frame.size.width - space) / 2.0
//               return CGSize(width: size, height: size)
//           }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)//here your custom value for spacing
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
    
            return CGSize(width:widthPerItem, height:100)
        }
    
}
