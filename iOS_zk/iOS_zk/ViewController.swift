//
//  ViewController.swift
//  iOS_zk
//
//  Created by kunzhang on 2018/6/5.
//  Copyright © 2018年 kunzhang. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UITabBarControllerDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataArr:[kkHomeModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
//        self.tableView?.register(UINib.init(nibName: "zkHomeCell", bundle: nil), forCellReuseIdentifier: "zkHomeCell")
        self.tableView?.register(UINib.init(nibName: "kkHomeCell", bundle: nil), forCellReuseIdentifier: "kkHomeCell")
//        self.tableView.register(kkIndexCell.classForCoder(), forCellReuseIdentifier: "kkIndexCell")
        self.tableView?.estimatedRowHeight = 1000
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView.backgroundColor = UIColor.init(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        self.getData()
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.getData()
        })
        
        
 
    }

    func getData() {
        
        kkRequestTool.GETRequestWithUrlstringAndDict(url: "http://static.youshikoudai.com/mockapi/data", params:[:]) { (result, key , message, error) in
            self.tableView?.mj_header.endRefreshing()
            if error == nil {
                
                if key == 1 {
                    
                    self.dataArr = kkHomeModel.mj_objectArray(withKeyValuesArray: result) as! [kkHomeModel]
                    
                    self.tableView.reloadData()

                }else {
                    
                }
            }else {
                self.tableView?.mj_header.endRefreshing()
            }
            
        }
        
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 44
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kkHomeCell", for: indexPath) as! kkHomeCell
        cell.btA.addTarget(self, action: #selector(jumpAV), for: UIControlEvents.touchUpInside)
        cell.btB.addTarget(self, action: #selector(jumpBV), for: UIControlEvents.touchUpInside)
        let model:kkHomeModel = self.dataArr[indexPath.row]
        cell.model = model
        return cell
        
    }
    
    @objc func jumpAV() {
        
        let vc = UIViewController.init()
        vc.navigationItem.title = "AViewController"
        vc.view.backgroundColor = UIColor.red;
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func jumpBV() {
        
        let vc = UIViewController.init()
        vc.navigationItem.title = "BViewController"
        vc.view.backgroundColor = UIColor.blue;
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

