//
//  stockdata.swift
//  
//
//  Created by Anish Laddha on 1/1/19.
//

import Foundation
//use of alphadvantage api
// UO9X1E9VOWVEV4I9 is API key
let ticker = "MSFT"
print(ticker)
let api_key = "UO9X1E9VOWVEV4I9"
func makeGetCall() {
    // Set up the URL request
    let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
    guard let url = URL(string: todoEndpoint) else {
        print("Error: cannot create URL")
        return
    }
    let urlRequest = URLRequest(url: url)
    
    // set up the session
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    
    // make the request
    let task = session.dataTask(with: urlRequest) {
        (data, response, error) in
        // check for any errors
        guard error == nil else {
            print("error calling GET on /todos/1")
            print(error!)
            return
        }
        // make sure we got data
        guard let responseData = data else {
            print("Error: did not receive data")
            return
        }
        // parse the result as JSON, since that's what the API provides
        do {
            guard let todo = try JSONSerialization.jsonObject(with: responseData, options: [])
                as? [String: Any] else {
                    print("error trying to convert data to JSON")
                    return
            }
            // now we have the todo
            // let's just print it to prove we can access it
            print("The todo is: " + todo.description)
            
            // the todo object is a dictionary
            // so we just access the title using the "title" key
            // so check for a title and print it if we have one
            guard let todoTitle = todo["title"] as? String else {
                print("Could not get todo title from JSON")
                return
            }
            print("The title is: " + todoTitle)
        } catch  {
            print("error trying to convert data to JSON")
            return
        }
    }
    task.resume()
}
makeGetCall()

