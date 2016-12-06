//
//  ViewController.swift
//  AppDemo
//
//  Created by adminisitradorUTM on 05/12/16.
//  Copyright © 2016 cursodeios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var array = ["Hola"]
    
    var filaSeleccionada = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("vista cargada")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view = segue.destination as! DetalleViewController
        view.numerFila = filaSeleccionada
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        /*let proto = (indexPath.row % 2 == 0) ? "proto1" : "proto2"
        
        let vista = tableView.dequeueReusableCell(withIdentifier: proto, for: indexPath) as! FilaTableViewCell
        
        if(indexPath.row % 2 == 0){
            vista.lbIzquierda.text = "Index!"
            vista.lbDerecha.text = "\(indexPath.row)"
        }else
        {
            vista.lbDerecha.text = "Index!"
            vista.lbIzquierda.text = "\(indexPath.row)"
        }
        
        return vista*/
        
        //F2
        
       let vista = tableView.dequeueReusableCell(withIdentifier: "proto1", for: indexPath) as! FilaTableViewCell
        
            vista.lbIzquierda.text = "Index!"
            vista.lbDerecha.text = "\(indexPath.row)"
        
            return vista
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:  IndexPath)    {
        filaSeleccionada = indexPath.row
        performSegue(withIdentifier: "Detalle Segue", sender: self)
    }
    
    @IBOutlet weak var entrar: UIButton!

}

