//
//  SKAnswerViewController.swift
//  65AppsTasks
//
//  Created by Sergey Kharitonov on 03.07.2018.
//  Copyright © 2018 Sergey Kharitonov. All rights reserved.
//

import UIKit

class SKAnswerViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.answerLabel.text = "Синхронный вызов блокирует очередь, которая ее вызывает, до тех пор пока не выполнит свою задачу. Таким образом в нашем примере происходит синхронный вызов из задачи которая выполняется в этой же очереди. Таким образом происходит блокировка очереди (deadlock)."
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
