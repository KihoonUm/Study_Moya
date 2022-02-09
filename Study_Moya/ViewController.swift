//
//  ViewController.swift
//  Study_Moya
//
//  Created by Bard on 2021/09/16.
//

import UIKit
import Moya

class ViewController: UIViewController {

    @IBOutlet var textBefore: UITextView!
    @IBOutlet var textAfter: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        jokeSet()
    
    }
    
    func transText(text : String) {
        let provider = MoyaProvider<PapagoAPI>()
        provider.request(.transText(text)) {(result) in
            switch result{
            case let .success(response):
                let transData = try? response.map(PaPagoTrans.self)
                guard let trans = transData?.message?.result?.translatedText else {
                    return
                }
                self.textAfter.text = trans
            case .failure(_):
                print(Error.self)
            }
        }
    }
    
    func jokeSet() {
        let provider = MoyaProvider<JokeAPI>()
        provider.request(.randomJokes("Um", "Bard")) {(result) in
            switch result {
            case let .success(response):
                let result = try? response.map(Joke.self)
                guard let str = result?.value?.joke else {
                    return
                }
                self.textBefore.text = str
                self.transText(text: str)
            case .failure(_):
                print(Error.self)
            }
        }
    }
    
    @IBAction func reset_Joke(_ sender : UIButton) {
        jokeSet()
    }
    
    
}

