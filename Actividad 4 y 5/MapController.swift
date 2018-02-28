//
//  MapController.swift
//  Actividad 4 y 5
//
//  Created by Alumno IDS on 20/02/18.
//  Copyright © 2018 Alumno IDS. All rights reserved.
//

import UIKit
import GoogleMaps

class MapController: UIViewController {
    
    var camera : GMSCameraPosition?
    var mapView : GMSMapView?
    let puntoDelUsuario = CGPoint (x:20.731994, y:-103.38217)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        logout()
        
        //Themes 4,5
        
        var user = User(name: "Juan Cabral", image: "penguin.png")
        var post = Post(text: "Swift ", imageUrl: "post_image.png", user: user)
        
        post.incrementComments()
        post.incrementComments()
        post.incrementLikes()
        post.incrementLikes()
        
        print("comments: \(post.getComments()); likes: \(post.getLikes());")
        print("tuple: \(post.getCounters()); \(post.getDisplayTimeAgo(date:  Date(timeIntervalSinceNow: -60*60*24*7*4)))")
        print("userId: \(post.user?.id)")
        
        view.backgroundColor = UIColor.blue
        GMSServices.provideAPIKey("AIzaSyD87_T-gzBD7IRemc4J2oDOzbQKRT9huI8")
        
        //Posicionamiento de la camara -> 20.771995,-103.38216
        camera = GMSCameraPosition.camera(withLatitude: 20.821995, longitude: -103.38216, zoom: 12)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera!)
        mapView?.isMyLocationEnabled = true
        view = mapView
 
        let marquer1 = CGPoint (x:20.731995, y:-103.38216)
        let marquer2 = CGPoint (x:20.741995, y:-103.38216)
        let marquer3 = CGPoint (x:20.751995, y:-103.38216)
        let marquer4 = CGPoint (x:20.761995, y:-103.38216)
        let marquer5 = CGPoint (x:20.771995, y:-103.38216)
        let marquer6 = CGPoint (x:20.781995, y:-103.38216)
        let marquer7 = CGPoint (x:20.791995, y:-103.38216)
        let marquer8 = CGPoint (x:20.801995, y:-103.38216)
        let marquer9 = CGPoint (x:20.811995, y:-103.38216)
        let marquer10 = CGPoint (x:20.821995, y:-103.38216)
        
        var lista : [CGPoint] = [marquer1,marquer2,marquer3,marquer4,marquer5,marquer6,marquer7,marquer8,marquer9,marquer10]
        
        do{
        var point = getPoints(lista:lista, referencePoint: puntoDelUsuario, radio: 0.04)
        //var cardinalidad = Cardinalidad(_lista: lista, _puntoDelUsuario: [puntoDelUsuario])
        }catch{
        print(error)}
        
        
        /*
            enum Cardinalidad{
            case norte
            case sur
            case este
            case oeste
        */
        }
    
    struct Punto {
        var resultado:Double
        var listaPunto:CGPoint
        var referenciaPunto:CGPoint
        init(r:CGPoint,referencePoint:CGPoint) {
            self.listaPunto = r
            self.referenciaPunto = referencePoint
            let xDist = listaPunto.x - referenciaPunto.x
            let yDist = listaPunto.y - referenciaPunto.y
            self.resultado = Double(sqrt((xDist * xDist) + (yDist * yDist)))
        }
        subscript(idx:Int) -> Double{
            get{
                return resultado
            }
        }
        
    }
    
    func PrintPoint(latYlon:CGPoint){
        let marquer = GMSMarker()
        marquer.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(latYlon.x), longitude: CLLocationDegrees(latYlon.y))
        marquer.map = mapView
    }
    
    
    func getPoints(lista:[CGPoint],referencePoint: CGPoint, radio: Double) -> [CGPoint]{
        let listaPunto = [CGPoint]()
        for listaPunto in lista{
            let punto = Punto(r: listaPunto, referencePoint: referencePoint)
            
            print(punto.resultado)
            if punto.resultado<radio{
                PrintPoint(latYlon: listaPunto)
            }
        }
        return listaPunto
    }
    
    struct Cardinalidad {
        var listaPunto2:CGPoint
        var referenciaPunto2:CGPoint
        init(Puntos:CGPoint,referencePoint:CGPoint) {
            self.listaPunto2 = Puntos
            
        }
        subscript(idx:Int) -> Double{
            get{
                return resultado
            }
        }
        
    }
     
    /* func Cardinalidad(_lista:[CGPoint], _puntoDelUsuario: CGPoint) -> CGFloat {
        let lat1 = puntoDelUsuario.x
        let lon1 = puntoDelUsuario.y
        let lat2 = listaPunto2.x
        let lon2 = listaPunto2.y
        
        for listaPunto in _lista{
        lat2 = listaPunto.x
        lon2 = listaPunto.y
        }
        
        let dLon = lon2 - lon1
        
        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let ResultadoCardinalidad = atan2(y, x)
    
        return CGFloat(radiansBearing)
    }*/
    
    /*funcion de sacar distancia: primer intento :)
     
    func distance(_ puntoDelUsuario: CGPoint, _ b: CGPoint) -> CGFloat{
        let xDist = puntoDelUsuario.x - b.x
        let yDist = puntoDelUsuario.y - b.y
        return CGFloat(sqrt((xDist * xDist) + (yDist * yDist)))
    }
    */
    
    //themes 6,7
    
    //we have x number of near positions
    //we have a radius
    //we have the user position
    //set of 20 positions
    
    //Point
    //longitud
    //latitud
    
    //var p1 = Point(12.2,-12.2)
    //list.append(p1)
    
    //Enum Cardinality
    // North
    // West
    // South
    // East
    //we need to find the closest position given a user position
    
    // if x== 0 then we throw an exception
    
    //func getXNumbers(list<Point>, userPosition: Point, radius:Int) -> list<Tuple(Point,Cardinality)> throws
    //function will throw an exception if there's no point at all
    //guard check and render the closest x euclidean distance in the map
    
    //userposition -> render in the map if and only if there's no exception
    
    func logout(){
        var loginController: LoginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}
