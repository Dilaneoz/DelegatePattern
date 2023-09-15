//
//  RenkSecViewController.swift
//  DelegatePatternOrnek
//
//  Created by Opendart Yazılım ve Bilişim Hizmetleri on 19.03.2023.
//

import UIKit

protocol ColorSelectedDelegate {
    func colorSelect(name : String)
}

class RenkSecViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
  

    var delegate : ColorSelectedDelegate! // RenkSecViewController ın içerisinde bir delegate tanımı yaptık(protocol ColorSelectedDelegate) ve onun tipinde bir değişken tanımladık
    
    @IBOutlet weak var colorPickerView: UIPickerView!
    
    let renkler = ["Mavi","Sarı","Kırmızı","Yeşil","Siyah","Beyaz"]
    var seciliRenk = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // bir görünüme sahip ol
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return renkler.count // renk sayısı kadar göster
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return renkler[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { // seçili elemanı vericek
        seciliRenk = renkler[row]
        print(seciliRenk)
        delegate.colorSelect(name: seciliRenk) // delegate i kullanmış olan ilgili viewcontroller a seçili renk verilir
        self.dismiss(animated: true,completion: nil) // açık olan sayfa kapatılır
        
        
    }

}
