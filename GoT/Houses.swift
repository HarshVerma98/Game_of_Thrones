//
//  Houses.swift
//  GoT
//
//  Created by Harsh Verma on 19/07/20.
//  Copyright © 2020 Harsh Verma. All rights reserved.
//

import Foundation
class Houses {

    var houseArray: [houseInfo] = []
    var url = "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=50"
    var pageNo = 1
    var cont = true
    
    func getdata(completed: @escaping() -> ()) {
        let urlString = "https://www.anapioficeandfire.com/api/houses?page=\(pageNo)&pageSize=50"
        guard let url = URL(string: urlString) else {
            print("Error Creation in URL")
            completed()
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let ER = error {
                print("Error: \(ER.localizedDescription)")
            }
            do {
                let R = try JSONDecoder().decode([houseInfo].self, from: data!)
                if R.count > 0 {
                    self.pageNo = self.pageNo + 1
                    self.houseArray = self.houseArray + R
                }else {
                    self.cont = false
                }
                print("***Returned: \(self.houseArray)")
            }catch {
                print("JSON ERROR:= \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
    
}
