//
//  ViewController.swift
//  DemoUIPageControl
//
//  Created by dan phi on 14/03/2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UIPageViewControllerDataSource {
 
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .cyan
        return table
    }()
    
    lazy var vc: [UIViewController] = {
        let green = UIViewController()
        green.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: green.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: green.view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: green.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: green.view.trailingAnchor).isActive = true
        
        let red = UIViewController()
        red.view.backgroundColor = .red
        
        let yellow = UIViewController()
        yellow.view.backgroundColor = .yellow
        
        return [green, red, yellow]
    }()
    
    lazy var pageView: UIPageViewController = {
        let page = UIPageViewController(transitionStyle:  .scroll, navigationOrientation: .horizontal)
        page.view.translatesAutoresizingMaskIntoConstraints = false
        page.setViewControllers([vc[0]], direction: .forward, animated: true)
        page.dataSource = self
        return page
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChild(pageView)
        self.view.addSubview(pageView.view)
        pageView.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        pageView.view.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor).isActive = true
        pageView.view.trailingAnchor.constraint(equalTo:  self.view.trailingAnchor).isActive = true
        pageView.view.bottomAnchor.constraint(equalTo:  self.view.bottomAnchor).isActive = true
        pageView.didMove(toParent: self)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vc.firstIndex(of: viewController) else {
            return nil
        }
//        let reducedIndex =  index - 1
//        guard  reducedIndex >= 0 else {
//            return nil
//        }
//        guard vc.count > reducedIndex else {
//            return nil
//        }
                
        return vc[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vc.firstIndex(of: viewController) else {
            return nil
        }
//        let icreasedIndex =  index + 1
//        guard  icreasedIndex >= 0 else {
//            return nil
//        }
//
//        guard vc.count > icreasedIndex else {
//            return nil
//        }
                
        return vc[index + 1]
    }
    
}
