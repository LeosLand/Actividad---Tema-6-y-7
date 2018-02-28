//: Playground - noun: a place where people can play
//let xDist = listaPunto2.x - referenciaPunto2.x
//let yDist = listaPunto2.y - referenciaPunto2.y
import UIKit

struct Cardinalidad {
    var listaPunto2:CGPoint
    var referenciaPunto2:CGPoint
    init(Puntos:CGPoint,referencePoint:CGPoint) {
        self.listaPunto2 = Puntos
        self.referenciaPunto2 =  referencePoint
    }
    subscript(indexado idx:Int) -> String{
        get{
            print("hola")
            return "\(self.listaPunto2.x)  \(self.referenciaPunto2.y)"
        }
    }
    
}
var currentPoint = CGPoint(x: 0, y: 0)
var placePoint = CGPoint(x: 3, y: 5)
var resultado: Cardinalidad = Cardinalidad(Puntos: currentPoint, referencePoint: placePoint)

func cardi (struc:Cardinalidad){

}


