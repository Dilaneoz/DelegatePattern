//
//  AnasayfaViewController.swift
//  DelegatePatternOrnek
//
//  Created by Opendart Yazılım ve Bilişim Hizmetleri on 19.03.2023.
//

import UIKit

class AnasayfaViewController: UIViewController,ColorSelectedDelegate { // "ColorSelectedDelegate" bu daha önce tanımladığımız delegate ten bu viewcontrollerın da haberdar olması sağlanır
  
    // delegate bir olay olduğunda belli bir nesnenin başka bir nesneye haber göndermesi gerektiği durumlarda kullanılır. aslında bir design pattern yani yaklaşımdır. x nesnesinde bir işlem tamamlandığında tamamladığı işlemi b nesnesinin de bilmesi gerekmektedir. örneğin bir viewcontrollerda olan şeyi diğer viewcontroller a haber vermek istiyorsak delegate kullanırız
    
    @IBOutlet weak var lblSeciliRenk: UILabel!
    
    @IBAction func btnSecAction(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "RenkSecViewControllerID") as! RenkSecViewController // RenkSecViewController a git
        
        vc.delegate = self // RenkSecViewController da olanlardan AnasayfaViewController ın haberdar olması için vc.delegate = self ifadesi tanımlanır. bu iki viewcontroller arasında bağlantı kuruyoruz. böylece aynı tableview ya da collectionview lerde olduğu gibi bir veri yüklendiğinde ana viewcontrollerın da haberdar olması için bu delegate komutunu kullanırız
        self.present(vc,animated: true,completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func colorSelect(name: String) {
        print(name)
        lblSeciliRenk.text = name
        
    }
    

}
