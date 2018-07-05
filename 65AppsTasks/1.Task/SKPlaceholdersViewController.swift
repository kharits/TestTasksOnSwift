//
//  SKPlaceholdersViewController.swift
//  65AppsTasks
//
//  Created by Sergey Kharitonov on 03.07.2018.
//  Copyright © 2018 Sergey Kharitonov. All rights reserved.
//

import UIKit

class SKPlaceholdersViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.tableView.register(UINib.init(nibName:"SKPrototypeTableViewCell", bundle: nil), forCellReuseIdentifier: kPrototypeTableViewCellIdentifier);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK - UITableView DataSource and Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: SKPrototypeTableViewCell = tableView.dequeueReusableCell(withIdentifier:kPrototypeTableViewCellIdentifier) as! SKPrototypeTableViewCell
        
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let width:NSInteger = NSInteger(UIScreen.main.bounds.width*UIScreen.main.scale);
        let height:NSInteger = NSInteger(150*UIScreen.main.scale);
        
        let url = URL.init(string: String.init(format: "http://placehold.it/\(width)x\(height)?text=\(indexPath.row+1)"));
        
        self.downloadImage(withURL: url!, forCell: cell);
        
    }
    
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) {
        
        let imageLoader = SKImageLoaderService.init();
        imageLoader.downloadImage(withURL: url){
            (image, error) -> Void in
            if image != nil{
                DispatchQueue.main.async {
                    let prototypeCell = cell as! SKPrototypeTableViewCell;
                    prototypeCell.prototypeImageView.image = image;
                }
            }else{
                DispatchQueue.main.async {
                    let prototypeCell = cell as! SKPrototypeTableViewCell;
                    prototypeCell.prototypeImageView.image = UIImage.init();
                }
            }
        }
        
    }

}
