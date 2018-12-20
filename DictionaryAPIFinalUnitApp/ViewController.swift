//
//  ViewController.swift
//  DictionaryAPIFinalUnitApp
//
//  Created by EVERETT MCLANE on 11/12/18.
//  Copyright © 2018 EVERETT MCLANE. All rights reserved.
//

import UIKit




//func onDefineButtonTapped(_ sender: UIButton) {
//    wordTextField.text = word_id
//    //            definitionLabel.text =
//}

class ViewController: UIViewController {
    
    var dictionary = [[String: String]]()
    let appId = "35c4c531"
    let appKey = "2fa6360df487d19fa04c687edff4442b"
    let language = "en"
    var word = ""
//    let id: String = ""
    
    typealias JSONDictionary = [String: Any]
    
//    var definitions = String()
//    var examples = String()
//    var subsenses = String()
    //word id is case sensitive and lowercase is required
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var wordTextField: UITextField!
    

    
    @IBAction func onDefineButtonTapped(_ sender: UIButton) {
        if wordTextField.text != nil {
            word = wordTextField.text!
            parse()
        }
//
//        print(URLResponse())
//        guard let word = wordTextField.text else { return }
//        parse()
    }
    
    func parse() {
        let word_id = word.lowercased()
        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/entries/\(language)/\(word_id)")!
        //        let word = id
        //        let otherDefinitions = subsenses
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        let session = URLSession.shared
        _ = session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response,
                let data = data,
            let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject] {
                //                print(response)
                //                print(jsonData)
//                print(jsonData["results"] as Any)
//                print(jsonData["entries"] as Any) // does not work
//

                let results = jsonData["results"] as? [JSONDictionary]
               // let entries = jsonData["entries"] as Any //does not work
                for result in results! {
                print(result)
                }
                    //working through entries level
//                let lexicalEntries = results?["lexicalEntries"] as? [String:String]
                //                print(lexicalEntries)
//                let entries = jsonData["entries"] as Any
//                let senses = jsonData["senses"] as Any
//                let definitions = jsonData["definitions"] as Any
                //                print(entries)
            } else {
                print(error ?? print("default Value Called"))
                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue)!)
                
            }
        }).resume()
    }
    
}


//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
//
//                if let countries = json["Countries"] as? [[String: AnyObject]] {
//                    for country in countries {
//                        if let couname = country["countryname"] as? [AnyObject] {
//                            country_names.append(couname)
//                        }
//
//                        if let coucode = country["code"] as? [AnyObject] {
//                            country_codes.append(coucode)
//                        }
//
//                    }
//                }
//            } catch {
//                print("Error Serializing JSON: \(error)")
//            }
