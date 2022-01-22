//
//  MasterTableViewCell.swift
//  Assesment
//
//  Created by Joseph on 11/01/2022.
//

import UIKit
//import SDWebImage

class MasterTableViewCell: UITableViewCell {
    
    //MARK: - Outlest
    
    static let identifer = "MasterTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topRatedLabel: UILabel!
    @IBOutlet weak var animieImage: UIImageView! {
        didSet {
            animieImage.layer.cornerRadius = animieImage.frame.width/2
            animieImage.backgroundColor = .gray
        }
    }
    
    //MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func registerNib(tableView: UITableView) {
        let nib = UINib(nibName: "MasterTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MasterTableViewCell.identifer)
    }
    
    static func cellFor(tableView: UITableView, indexPath: IndexPath, animie: Master.Animie) -> MasterTableViewCell {
        
        let cell: MasterTableViewCell = tableView.dequeueReusableCell(withIdentifier: MasterTableViewCell.identifer) as! MasterTableViewCell
        cell.titleLabel.text = animie.title
        cell.topRatedLabel.text = animie.rated
        ///commenting below code since its been asked to remove sdwebimage
//        cell.imgAnimie.sd_setImage(with: URL(string: animie.imageURL ?? "")) { image, error, cache, url in
//
//        }
        return cell
    }
    
}
