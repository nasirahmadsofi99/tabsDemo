//
//  ViewController.swift
//  Demo
//
//  Created by Aqib Ali on 05/09/19.
//  Copyright © 2019 Aqib Ali. All rights reserved.
//

import UIKit


class VC1: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .yellow
    }
}

class VC2: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .green
    }
}

class VC3: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .purple
    }
}


class VC4: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
    }
}

class VC5: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .brown
    }
}

class VC6: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .blue
    }
}










class Tab {
    var title:String
    var isSelected:Bool
    var vc:UIViewController
    
    init(title:String,isSelected:Bool = false,vc:UIViewController) {
        self.title = title
        self.isSelected = isSelected
        self.vc = vc
    }
}


class TabCell: UICollectionViewCell {
    @IBOutlet weak var label:UILabel!
    @IBOutlet weak var selector:UIView!
    
    var tab:Tab?{
        didSet{
            label.text = tab?.title
            selector.isHidden = !(tab?.isSelected ?? false)
        }
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var container: UIView!
    
     var tabs = Array<Tab>()
    
    func addVC(vc:UIViewController){
        vc.view.frame = container.bounds
        vc.willMove(toParent: self)
        container.addSubview(vc.view)
        addChild(vc)
        vc.didMove(toParent: self)
    }

}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath) as! TabCell
        cell.tab = tabs[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tab = tabs[indexPath.row]
        addVC(vc: tab.vc)
        for (index,tab) in tabs.enumerated(){
            tab.isSelected = index == indexPath.row
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width/3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}











class viewc1: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc =  VC1()
        tabs.append(Tab(title: "Invite", isSelected: true, vc: vc))
        tabs.append(Tab(title: "Ongoing", vc: VC2()))
        tabs.append(Tab(title: "Completed", vc: VC3()))
        
        view.layoutIfNeeded()
        container.layoutIfNeeded()
        
        addVC(vc: vc)
        
    }
}

class viewc2: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc =  VC4()
        tabs.append(Tab(title: "Invite1", isSelected: true, vc: vc))
        tabs.append(Tab(title: "Ongoing1", vc: VC5()))
        tabs.append(Tab(title: "Completed1", vc: VC6()))
        
        view.layoutIfNeeded()
        container.layoutIfNeeded()
        
        addVC(vc: vc)
        
    }
}

