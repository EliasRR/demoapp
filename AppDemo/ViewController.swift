//
//  ViewController.swift
//  AppDemo
//
//  Created by adminisitradorUTM on 05/12/16.
//  Copyright © 2016 cursodeios. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetalleViewControllerDelegate, AgregarViewControllerDelegate {
    
    var array = ["Hola"]
    
    @IBOutlet weak var lbImage: UILabel!
   

    @IBOutlet weak var imageapp: UIImageView!
    @IBOutlet weak var tblTabla: UITableView!
    
     var filaSeleccionada = -1
    var esEdicion = false
     var datos = [("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23),("Elias", 27), ("María", 29), ("Jesus", 40), ("Eugenia", 35), ("Mariela", 23), ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("vista cargada")
        imageapp.image = UIImage(named: "image")
        lbImage.text = "Elias Rodríguez"
        
    }
    @IBAction func btnrefresh_Click(_ sender: Any) {
        let idFacebook = FBSDKAccessToken.current().userID
        let cadenaUrl = "http://graph.facebook.com/\(idFacebook!)/picture?type=large"
        
        imageapp.loadPicture(url: cadenaUrl)
        //imageapp.image = UIImage(data:Data(contentsOf: URL(String: "http:www.google.com")))
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
            if(esEdicion){
                    view.fila = filaSeleccionada
                    view.Nombre = datos[filaSeleccionada].0
                    view.Edad = datos[filaSeleccionada].1
                esEdicion = false
            }
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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let eliminar = UITableViewRowAction(style: .destructive, title: "Borrar", handler: borrarFila)
        let editar = UITableViewRowAction(style: .normal, title: "Editar", handler: editarFila)
        
        return [eliminar, editar]
    }
    func borrarFila(sender : UITableViewRowAction, indexPath : IndexPath){
        datos.remove(at: indexPath.row)
        tblTabla.reloadData()
    }
    func editarFila(sender : UITableViewRowAction, indexPath : IndexPath){
        esEdicion = true
        filaSeleccionada = indexPath.row
        performSegue(withIdentifier: "Agregar segue", sender: sender)
        
    }
    func modificarRegistro(nombre: String, edad: Int, fila: Int) {
        datos.remove(at: fila)
        datos.insert((nombre, edad), at: fila)
        tblTabla.reloadData()
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
        
        //vista.imgFoto.image = UIImage(named: "image")
        
        let idFacebook = FBSDKAccessToken.current().userID
        let cadenaUrl = "http://graph.facebook.com/\(idFacebook!)/picture?type=large"
        let url = URL(string: cadenaUrl)
        let dato : Data?
        
        do {
            dato = try  Data(contentsOf: url!)
            vista.imgFoto.image = UIImage(data: dato!)
            
        }catch{
            print ("Error al cargar la imagen \(error)")
            dato = nil
            vista.imgFoto.image = UIImage(named: "image")
        }

        
            return vista
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:  IndexPath)    {
        filaSeleccionada = indexPath.row
        performSegue(withIdentifier: "Detalle Segue", sender: self)
        
        
    }
    
    @IBOutlet weak var entrar: UIButton!

}

