//
//  ViewController.swift
//  FetchDataUsingCodingKey_3
//
//  Created by Admin on 28/02/23.
//

import UIKit

class ViewController: UIViewController {
    var allData = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    private func fetchData(){
        let url = URL(string: "https://fakestoreapi.com/carts")
        let request = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with:request){
            data,response,error in
            if(error==nil){
                do{
                    let jsonData = try JSONDecoder().decode([DataModel].self, from: data!)
                    self.allData = jsonData
                    self.accessData()
                    
                    DispatchQueue.main.async {
                        //reload tableView
                    }
                }
                catch{
                    print("Decode error")
                }
            }
            else{
                print("Please check api or Internet")
            }
        }
        dataTask.resume()
    }
    
    private func accessData(){
        print(allData[0].id)
        print(allData[0].products[0].quantity)
    }
}

