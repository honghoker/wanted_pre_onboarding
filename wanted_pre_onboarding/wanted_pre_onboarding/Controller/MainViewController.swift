//
//  ViewController.swift
//  wanted_pre_onboarding
//
//  Created by 홍은표 on 2022/07/23.
//

import UIKit

class MainViewController: UIViewController {
    private var currentWeatherData: [GroupWeatherItem] = [GroupWeatherItem]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        fetchData()
    }
    
    func initView() {
        self.navigationItem.title = "오늘의 날씨"
        
        collectionView.backgroundColor = .white
        collectionView.register(MainViewUICollectionViewCell.self, forCellWithReuseIdentifier: "collectionView")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        self.view.addSubview(collectionView)
    }
    
    func fetchData() {
        let parameters: [String: Any] = [
            "id": myCitiesMap.keys.map{String($0)}.joined(separator: ","),
            "units": "metric", // 섭씨 온도
            "lang": "kr",
            "appid": weatherAPIKey
        ]
        
        let request = APIReqeust(method: .get, path: BasePath.group, queryItems: parameters)
        
        APICenter().request(urlString: BaseURL.weatherURL, request: request) {
            [weak self] (result) in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let response):
                if let response = try? response.decode(to: GroupWeatherInfo.self) {
                    // MARK: - 도시 한글 이름순 정렬
                    self.currentWeatherData = response.body.GroupWeatherItem.sorted { myCitiesMap["\($0.id)"]! < myCitiesMap["\($1.id)"]! }
                } else {
                    print("MainViewController fetchData success Error : ", APIError.decodingFailed)
                }
            case .failure(let error):
                guard let err = error as APIError? else {
                    return
                }
                print("MainViewController fetchData failure Error : ", err)
            }
        
        }
    }
}

// MARK: - Cell Data
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentWeatherData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as! MainViewUICollectionViewCell
        cell.backgroundColor = .black.withAlphaComponent(0.5)
        cell.weatherItem = currentWeatherData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.weatherItem = currentWeatherData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Cell Layout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    // 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // 셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let size = CGSize(width: width - 24, height: width / 3)
        return size
    }
}
