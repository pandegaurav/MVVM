//
//  BayutStuffTableViewCell.swift
//  Bayut
//
//  Created by Pande, Gaurav on 19/02/21.
//

import UIKit

class BayutStuffTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var titleImageView       : UIImageView!
    @IBOutlet weak var titleLabel           : UILabel!
    @IBOutlet weak var subtitleLabel        : UILabel!
    
    
    // MARK: - View LifeCycle


    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleImageView.layer.cornerRadius = self.titleImageView.frame.size.width/2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// MARK: - Image Extension


class ImageStore: NSObject {
    static let imageCache = NSCache<NSString, UIImage>()
}

extension UIImageView {
    func url(_ url: String?) {
        DispatchQueue.global().async { [weak self] in
            guard let stringURL = url, let url = URL(string: stringURL) else {
                return
            }
            func setImage(image:UIImage?) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
            let urlToString = url.absoluteString as NSString
            if let cachedImage = ImageStore.imageCache.object(forKey: urlToString) {
                setImage(image: cachedImage)
            } else if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    ImageStore.imageCache.setObject(image, forKey: urlToString)
                    setImage(image: image)
                }
            }else {
                setImage(image: nil)
            }
        }
    }
}
