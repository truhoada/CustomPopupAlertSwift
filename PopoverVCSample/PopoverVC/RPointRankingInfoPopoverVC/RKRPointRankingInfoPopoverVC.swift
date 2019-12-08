//
//  RKRPointRankingInfoPopoverVC.swift
//  PopoverVCSample
//
//  Created by TrungHD-D1 on 09.12.19.
//  Copyright © 2019 TrungHD. All rights reserved.
//

import UIKit

class RKRPointRankingInfoPopoverVC: BasePopoverVC {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var lbHeaderTitle: UILabel!
    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var imgClose: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    private var headerHeight: CGFloat = 64.0
    private var tableOffset: CGFloat = 16.0
    
    var headerTitle: String = "" {
        didSet {
            if lbHeaderTitle != nil {
                lbHeaderTitle.text = headerTitle
            }
        }
    }
    var contents: [String] = [] {
        didSet {
            if tableView != nil {
                tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        headerTitle = "Thông tin bảng xếp hạng"
        contents = ["Bảng xếp hạng của tháng được tổng kết vào 0h ngày mùng 1 của tháng kế tiếp.", "Bảng xếp hạng của tháng dựa trên tổng số R-Point bạn nhận được trong tháng ngoại trừ R-Point nhận được từ dịp sinh nhật, lễ, tết."]
            
        setupSubviews()
    }
}


//MARK: SETUP SUBVIEW
extension RKRPointRankingInfoPopoverVC {
    private func setupSubviews() {
        setupHeaderView()
        setupTableView()
        addGestureForSubviews()
    }
    
    private func setupHeaderView() {
        lbHeaderTitle.text = headerTitle
        headerView.backgroundColor = .white
        closeView.backgroundColor = .white
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.contentInset = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: tableOffset, right: 0.0)
        
        tableView.register(UINib.init(nibName: "PopoverInfoCell", bundle: nil), forCellReuseIdentifier: "PopoverInfoCell")
    }
    
    private func addGestureForSubviews() {
        closeView.addSingleTapGesture(target: self, selector: #selector(dismissPopup))
    }
}


//MARK: UITableViewDataSource, UITableViewDelegate
extension RKRPointRankingInfoPopoverVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopoverInfoCell", for: indexPath) as! PopoverInfoCell
        cell.bindingData(title: contents[indexPath.row])
        cell.hideSeparateView(indexPath.row == contents.count - 1 ? true : false)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let tbHeight = tableView.contentSize.height + tableOffset
        heightContainerConstraint.constant = min(headerHeight + tbHeight, view.bounds.height*0.7)
    }
}

extension RKRPointRankingInfoPopoverVC: UITableViewDelegate {
    
}
