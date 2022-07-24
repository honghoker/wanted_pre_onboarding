//
//  Extension+UIImageView.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageUrl(_ url: String) {
        // 캐시에 사용될 key 값
        let cacheKey = NSString(string: url)
        
        if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) {
            // 해당 key에 캐시미이지가 저장되어 있으면 이미지를 사용
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            if let imageUrl = URL(string: url) {
                URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                    if let _ = error {
                        DispatchQueue.main.async {
                            self.image = UIImage()
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        if let data = data, let image = UIImage(data: data) {
                            // 다운로드 된 이미지를 캐시에 저장
                            ImageCacheManager.shared.setObject(image, forKey: cacheKey)
                            
                            self.image = image
                        }
                    }
                }.resume()
            }
        }
    }
}
