//: Playground - noun: a place where people can play

import UIKit
import AFNetworking

var str = "Hello, playground"

extension String {
    func reversa ()-> String {
        print ("reversando")
        return "hola"
    }
    func IntValue ()-> Int{
        
        return Int(self)!
    }
    func validar() -> Bool {
        return self.characters.first == "A"
    }
}

Int("0")!
"Hola".validar()
"B".validar()
"Elias".validar()
"A".validar()

extension Int {
    func cuadrado() -> Int {
       return self * self
    }
}

3.cuadrado()
