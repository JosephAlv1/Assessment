//
//  MasterTableViewCell.swift
//  Assesment
//
//  Created by Joseph on 11/01/2022.
//

import UIKit
import SDWebImage

class MasterTableViewCell: UITableViewCell {
    
    static let identifer = "MasterTableViewCell"
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTopRated: UILabel!
    @IBOutlet weak var imgAnimie: UIImageView!
    
    
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
        cell.lblTitle.text = animie.title
        cell.lblTopRated.text = animie.rated
        cell.imgAnimie.sd_setImage(with: URL(string: animie.imageURL ?? "")) { image, error, cache, url in
            
        }
        return cell
    }
    
}
