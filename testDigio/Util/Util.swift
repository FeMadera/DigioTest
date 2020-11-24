//
//  Util.swift
//  testDigio
//
//  Created by Felipe madeira on 20/11/20.
//

import Foundation
import UIKit

//MARK: - Download Img Url
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        self.downloaded(from: url, contentMode: mode)
    }
}

//MARK: - Create custom tableViewCell
extension UITableViewCell {
    class func createCell<T: UITableViewCell>(_ tableView: UITableView, indexPath: IndexPath) -> T {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            return T()
        }
        return cell
    }
}

//MARK: - Create custom collectionViewCell
extension UICollectionViewCell {
    class func createCell<T: UICollectionViewCell>(_ collectionView: UICollectionView, indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            return T()
        }
        return cell
    }
}

//MARK: - Round Corner Views
extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func roundCornersWithShadown( _ shadowColor: CGColor = UIColor.lightGray.cgColor, _ shadowOffset: CGSize = CGSize(width: -2, height: 2), _ shadowOpacity: Float = 0.3, _ shadowRadius: CGFloat = 6    ) {
        
        
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
    }
    
    func shadownBack() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 2
    }
}
