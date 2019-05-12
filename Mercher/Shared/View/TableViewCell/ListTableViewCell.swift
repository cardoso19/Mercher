//
//  ListTableViewCell.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    //MARK: - IBOutlet
    @IBOutlet weak var viewList: UIView!
    @IBOutlet weak var viewListDetail: UIView!
    @IBOutlet weak var viewLineListName: UIView!
    @IBOutlet weak var viewLineTotalItems: UIView!
    
    @IBOutlet weak var labelListName: UILabel!
    @IBOutlet weak var labelDueDateTitle: UILabel!
    @IBOutlet weak var labelDueDateValue: UILabel!
    @IBOutlet weak var labelDelayByTitle: UILabel!
    @IBOutlet weak var labelDelayByValue: UILabel!
    @IBOutlet weak var labelLastUpdateTitle: UILabel!
    @IBOutlet weak var labelLastUpdateValue: UILabel!
    @IBOutlet weak var labelTotalItemsTitle: UILabel!
    @IBOutlet weak var labelTotalItemsValue: UILabel!
    @IBOutlet weak var labelPayableAmountTitle: UILabel!
    @IBOutlet weak var labelPayableAmountValue: UILabel!
    
    @IBOutlet weak var imageViewUser: UIImageView!
    
    @IBOutlet weak var buttonMenu: UIButton!
    @IBOutlet weak var buttonPlaceHorder: UIButton!
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
