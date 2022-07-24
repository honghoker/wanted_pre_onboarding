//
//  ImageCache.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import Foundation
import UIKit

public class ImageCacheManager {
    public static let shared = NSCache<NSString, UIImage>()
    private init() { }
}
