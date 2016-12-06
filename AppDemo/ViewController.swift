//
//  ViewController.swift
//  AppDemo
//
//  Created by adminisitradorUTM on 05/12/16.
//  Copyright © 2016 cursodeios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetalleViewControllerDelegate, AgregarViewControllerDelegate {
    
    var array = ["Hola"]
    
    @IBOutlet weak var tblTabla: UITableView!
    
     var filaSeleccionada = -1
     var datos = [("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("vista cargada")
    }

    @IBAction func btnAgregar(_ sender: Any) {
        performSegue(withIdentifier: "Agregar segue", sender: self)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
       
        
    }
    // MARK: DetalleView Delegates
    func numeroCambiado(numero : Int){
        print ("Numero Cambiado: \(numero)")
        datos[numero].1 = datos[numero].1 + 1
        tblTabla.reloadData()
        
        
    }
    // MARK: Declaraciones
   
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case "Detalle Segue":
            let view = segue.destination as! DetalleViewController
            view.numeroFila = filaSeleccionada
            view.dato = datos[filaSeleccionada].0
            view.datoNumero = datos[filaSeleccionada].1
            view.delegado = self
            break
        case "Agregar segue":
            let view = segue.destination as! AgregarViewController
            
            view.delegado = self
            break
        default:
            break
        }
       
        
       
    }
    
    // MARK: - Agregar delegados
    func agregarRegistro(nombre : String, edad: Int){
        datos.append((nombre, edad))
        tblTabla.reloadData()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return datos.count
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
        
            vista.lbIzquierda.text = "\(datos[indexPath.row].0)"
            vista.lbDerecha.text = "\(datos[indexPath.row].1)"
        
            return vista
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:  IndexPath)    {
        filaSeleccionada = indexPath.row
        performSegue(withIdentifier: "Detalle Segue", sender: self)
        
        
    }
    
    @IBOutlet weak var entrar: UIButton!

}

