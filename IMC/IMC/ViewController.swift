//
//  ViewController.swift
//  IMC
//
//  Created by Eduardo Queiroz on 26/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tf_weight: UITextField!
    @IBOutlet weak var tf_height: UITextField!
    @IBOutlet weak var lb_results: UILabel!
    @IBOutlet weak var iv_results: UIImageView!
    @IBOutlet var vi_results: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

    @IBAction func calculate( sender: Any) {
        if let weight = Double(tf_weight.text!), let height = Double(tf_height.text!) {
            imc = weight / (height*height)
            showResults()
        }
    }
    func showResults(){
        var results: String = ""
        var image: String = ""
        switch imc {
            case 0..<16:
                results = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                results = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                results = "Peso ideal"
                image = "ideal"
            case 25..<30:
                results = "Sobrepeso"
                image = "sobre"
            default:
                results = "Obesidade"
                image = "obesidade"
        }
        lb_results.text = "\(Int(imc)): \(results)"
        iv_results.image = UIImage(named: image)
        vi_results.isHidden = false
        view.endEditing(true)
    }
}

