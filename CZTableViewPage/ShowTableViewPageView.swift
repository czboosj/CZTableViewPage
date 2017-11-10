//
//  ShowTableViewPageView.swift
//  CZTableViewPage
//
//  Created by boosj on 2017/11/7.
//  Copyright © 2017年 boosjcz. All rights reserved.
//

import UIKit
/// 失败 想来是因为重用问题 造成的
class ShowTableViewPageView: UIView ,UITableViewDelegate ,UITableViewDataSource {

    var tableView:UITableView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI();
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func initUI(){
        let tabFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100);
        self.tableView = UITableView(frame: tabFrame, style: UITableViewStyle.plain)
        self.addSubview(self.tableView);
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.isPagingEnabled = true;
        self.tableView.clipsToBounds = false;
        self.tableView.bounces = false; // 边缘反弹
        self.tableView.contentSize = self.bounds.size;
        self.tableView.showsVerticalScrollIndicator = false;
        self.tableView.backgroundColor = UIColor.blue;
        
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellName")
    }
    
    // tableView代理方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  100;
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil;
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001;
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellName")
        cell?.textLabel?.text = "位置 :\(indexPath.row)";
        cell?.backgroundColor = UIColor.brown;
        return cell!;
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event);
        if(view?.isEqual(self) == true){
            
            for  subView in self.tableView.subviews{
                let offset = CGPoint(x: point.x - self.tableView.frame.origin.x + self.tableView.contentOffset.x - subView.frame.origin.x, y: point.y-self.tableView.frame.origin.y+self.tableView.contentOffset.y-subView.frame.origin.y)
                if (view == subView.hitTest(offset, with: event)){
                    return view;
                }
                
            }
            return self.tableView;
        }
        return view;
    }

}
