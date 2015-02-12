//
//  ViewController.swift
//  Fun Facts
//
//  Created by Yangzi He on 2/9/15.
//  Copyright (c) 2015 Yangzi He. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var funFactButton: UIButton!
    
    let colorWheel = ColorWheel()
    let quoteGenerator = QuoteGenerator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        quoteGenerator.retrieveJoke()
        funFactLabel.text = quoteGenerator.joke
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showFunFact() {
        var color = colorWheel.randomColor()
        view.backgroundColor = color
        funFactButton.tintColor = color
        quoteGenerator.retrieveJoke()
        funFactLabel.text = quoteGenerator.joke
    }


}

