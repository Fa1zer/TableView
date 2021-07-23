//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 30.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet private weak var navigationBar: UINavigationItem!
    @IBOutlet private weak var headerView: ProfileHeaderView!
    
    private let cellid = "post"
    private let logInViewControler = LogInViewController()
    
    let posts: [ProfilePost] = [ProfilePost(autor: "apple",
                                              description: "AirTag — это суперлёгкий способ находить свои вещи. Прикрепите один трекер AirTag к ключам, а другой — к рюкзаку. И теперь их видно на карте в приложении «Локатор». Там же можно посмотреть, где находятся ваши устройства Apple, а также ваши друзья и семья.",
                                              image: "airtag",
                                              likes: 8484, views: 9009),
                                ProfilePost(autor: "apple.russia",
                                              description: "Процессор A14 Bionic далеко впереди других процессоров iPhone. Система камер Pro гораздо лучше работает при слабом освещении — а на iPhone 12 Pro Max ещё лучше. Ceramic Shield в четыре раза снижает риск повреждений дисплея при падении. Давайте посмотрим, как тут всё устроено.",
                                              image: "iphone 12 pro max",
                                              likes: 7585, views: 9569),
                                ProfilePost(autor: "samsung",
                                              description: "Представляем новый Galaxy S21 Ultra 5G. Его камеры — это киностудия у вас в руках. С ее помощью вы сможете снимать видео 8К и превращать каждый его кадр в яркий снимок — просто «на ходу». А сочетание сверхбыстрого 5-нм процессора Exynos, прочного стеклянного корпуса и аккумулятора на целый день работы полностью оправдывает его название — Ultra.",
                                              image: "samsung", likes: 1344,
                                              views: 5453),
                                ProfilePost(autor: "samsung.russia",
                                              description: "Квантовый прорыв в мире изображения",
                                              image: "neo qled", likes: 4045,
                                              views: 5595)]
    
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        setupViews()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(LogInViewController(),
                                                 animated: true)
    }
    
    func setupViews() {
        view.addSubview(tableView)
                        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellid)
        
        let constraints = [tableView.topAnchor.constraint(equalTo:
                                        view.safeAreaLayoutGuide.topAnchor),
                           tableView.bottomAnchor.constraint(equalTo:
                                                        view.bottomAnchor),
                           tableView.leadingAnchor.constraint(equalTo:
                                                        view.leadingAnchor),
                           tableView.trailingAnchor.constraint(equalTo:
                                                        view.trailingAnchor)]
        
                           NSLayoutConstraint.activate(constraints)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat { 220 }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { UITableView.automaticDimension }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? { headerView }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { posts.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell =
            tableView.dequeueReusableCell(withIdentifier: cellid,
                                            for: indexPath) as! PostTableViewCell
        
        cell.post = posts[indexPath.row]
        
        return cell
    }
}

struct ProfilePost {
    var autor: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}
