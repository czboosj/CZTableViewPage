//
//  ShowScrollViewPageView.swift
//  CZTableViewPage
//
//  Created by boosj on 2017/11/7.
//  Copyright © 2017年 boosjcz. All rights reserved.
//

import UIKit
///  重用思路, 每次是不会滑动很多的 , 全屏5个view 模块循环显示 , set 数据显示
class ShowScrollViewPageView: UIView ,UIScrollViewDelegate{
    let content_Height:CGFloat = 300
    let viewCount:Int = 4// 根据显示的 + 上下两个不显示的
    var scrollView:UIScrollView!
    /// 当前的位置
    var currentIndex = 0;
    var showViewArray:[UIImageView] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
       self.addScrollView()
        self.addImageView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func addScrollView(){
        let frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: content_Height)
        self.scrollView = UIScrollView(frame: frame)
        self.scrollView.isPagingEnabled = true;
        self.scrollView.clipsToBounds = false;
        self.scrollView.bounces = false;
        self.scrollView.showsVerticalScrollIndicator = false;
        self.scrollView.delegate = self;
        self.scrollView.contentOffset = CGPoint(x: 0, y: content_Height)
        self.scrollView.contentSize = CGSize(width: SCREEN_WIDTH, height: content_Height * CGFloat(viewCount));
        self.addSubview(self.scrollView)
    }
    func addImageView(){
        for i in 0 ..< viewCount{
            let imageFrame = CGRect(x: 0, y: CGFloat(i)*content_Height, width: SCREEN_WIDTH, height: content_Height)
            let imageView = UIImageView(frame: imageFrame)
            imageView.backgroundColor = UIColor.randomColor()
            
            self.scrollView.addSubview(imageView)
            self.showViewArray.append(imageView)
        }
        /// 这个设置下数据
        self.setdata()
    }
    
    func setdata(){
        
    }
    // scrollView
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y > content_Height){
            currentIndex += 1
        }else if (scrollView.contentOffset.y < content_Height){
            currentIndex -= 1
        }
        print("测试位置数据 \(currentIndex)");
        // 停止滚动
        self.scrollView.contentOffset = CGPoint(x: 0, y: content_Height)
    }
    
    
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event);
        if(view?.isEqual(self) == true){
            
            for  subView in self.scrollView.subviews{
                let offset = CGPoint(x: point.x - self.scrollView.frame.origin.x + self.scrollView.contentOffset.x - subView.frame.origin.x, y: point.y-self.scrollView.frame.origin.y+self.scrollView.contentOffset.y-subView.frame.origin.y)
                if (view == subView.hitTest(offset, with: event)){
                    return view;
                }
                
            }
            return self.scrollView;
        }
        return view;
    }

}
