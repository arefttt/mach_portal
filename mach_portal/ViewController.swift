//
//  ViewController.swift
//  mach_portal
//
//  Created by Ian Beer on 11/27/16.
//  Copyright © 2016 Ian Beer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var JailStatusLbl: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        JailStatusLbl.text = platform()
    }
    @IBAction func JailBreakDevice(_ sender: AnyObject) {
        DispatchQueue.main.async(execute: { () -> Void in
            jb_go();
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func platform() -> String {
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
    }
    
}

