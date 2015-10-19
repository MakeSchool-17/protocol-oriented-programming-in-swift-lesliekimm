protocol Vehicle {
    var kmPerHour: Double { get }
    func duration(distance: Double) -> Double
}

protocol GroundVehicle: Vehicle {
    var numOfWheels: Int { get }
}

protocol Vessel: Vehicle {
    var length: Double { get }
}

struct Car: GroundVehicle {
    var kmPerHour: Double
    var numOfWindows: Int
    var numOfWheels: Int
    
    init(kmPerHour: Double = 0.0, numOfWindows: Int = 0, numOfWheels: Int = 4) {
        self.kmPerHour = kmPerHour
        self.numOfWindows = numOfWindows
        self.numOfWheels = numOfWheels
    }
    
    func duration(distance: Double) -> Double {
        return distance / self.kmPerHour
    }
}

struct Bus: GroundVehicle {
    var kmPerHour: Double
    var numOfWindows: Int
    var numOfWheels: Int
    var seatingCapacity: Int
    
    init(kmPerHour: Double = 0.0, numOfWindows: Int = 0, numOfWheels: Int = 4, seatingCapacity: Int = 50) {
        self.kmPerHour = kmPerHour
        self.numOfWindows = numOfWindows
        self.numOfWheels = numOfWheels
        self.seatingCapacity = seatingCapacity
    }
    
    func duration(distance: Double) -> Double {
        return distance / self.kmPerHour
    }
}

struct ContainerShip: Vessel {
    var kmPerHour: Double
    var length: Double
    
    init(kmPerHour: Double = 0.0, length: Double = 30.0) {
        self.kmPerHour = kmPerHour
        self.length = length
    }
    
    func duration(distance: Double) -> Double {
        return distance / self.kmPerHour
    }
}

struct Boat: Vehicle {
    var kmPerHour: Double
    var numOfWindows: Int
    var length: Double
    
    init(kmPerHour: Double = 0.0, numOfWindows: Int = 0, length: Double = 30.0) {
        self.kmPerHour = kmPerHour
        self.numOfWindows = numOfWindows
        self.length = length
    }
    
    func duration(distance: Double) -> Double {
        return distance / self.kmPerHour
    }
}

struct Motorcycle: GroundVehicle {
    var kmPerHour: Double
    var numOfWheels: Int
    
    init(kmPerHour: Double = 0.0, numOfWheels: Int = 2) {
        self.kmPerHour = kmPerHour
        self.numOfWheels = numOfWheels
    }
    
    func duration(distance: Double) -> Double {
        return distance / self.kmPerHour
    }
}

var car = Car(kmPerHour: 120.0, numOfWindows: 6)
var bus = Bus(kmPerHour: 100.0, numOfWindows: 20)
var containerShip = ContainerShip(kmPerHour: 30.0)
var boat = Boat(kmPerHour: 30.0, numOfWindows: 8)
var motorcycle = Motorcycle(kmPerHour: 130)

print("The car has", car.numOfWindows, "windows and needs", car.duration(100.0), "hours to travel 100km.")
print("The bus has", bus.numOfWindows, "windows and needs", bus.duration(100.0), "hours to travel 100km.")
print("The container ship needs", containerShip.duration(100.0), "hours to travel 100km.")
print("The boat has", boat.numOfWindows, "windows and needs", boat.duration(100.0), "hours to travel 100km.")
print("The motorcycle has needs", motorcycle.duration(100.0), "hours to travel 100km.")



//: Playground - noun: a place where people can play

//import Cocoa

/**
Vehicles can have different properties and functionality.
All Vehicles:
- Have a speed at which they move
- Calculate the duration it will take them to travel a certain distance
All Vehicles except a Motorcycle and a Container Ship:
- Have an amount of Windows
Only Ground Vehicles:
- Have an amount of wheels
Only Buses:
- Have a seating capacity
Only Vessels:
- Have a length
Create the following Vehicles types: Car, Bus, ContainerShip, Boat, Motorcycle
----
The solution below does not use protocols, it relies solely on subclassing. Can you use protocols to improve the solution?


typealias KilometersPerHour = Double
typealias Kilometers = Double
typealias Hours = Double

class Vehicle {
    
    var speed: KilometersPerHour = 0
    
    func travelDuration(distance: Kilometers) -> Hours {
        return distance / speed
    }
    
}

class GroundVehicle: Vehicle {
    
    var wheels: Int = 0
    
}

class Car: GroundVehicle {
    
    var amountOfWindows: Int = 0
    
}

class MotorCycle: GroundVehicle {
    
}

class Bus: GroundVehicle {
    
    var capacity: Int = 0
    var amountOfWindows: Int = 0
    
}

class Vessel: Vehicle {
    
    var length: Int = 0
    
}

class Boat: Vessel {
    
    var amountOfWindows: Int = 0
    
}

class ContainerShip: Vessel {
    
}

var car = Car()
car.amountOfWindows = 6
car.speed = 120

var bus = Bus()
bus.amountOfWindows = 20
bus.speed = 100

var boat = Boat()
boat.amountOfWindows = 8
boat.speed = 30

var containerShip = ContainerShip()
containerShip.speed = 30

var motorcycle = MotorCycle()
motorcycle.speed = 130

let vehicles = [car, bus, boat, containerShip, motorcycle]

for v in vehicles {
    var amountOfWindowsSubstring = ""
    
    if let boat = v as? Boat {
        amountOfWindowsSubstring = " has \(boat.amountOfWindows) windows and"
    } else if let car = v as? Car {
        amountOfWindowsSubstring = " has \(car.amountOfWindows) windows and"
    } else if let bus = v as? Bus {
        amountOfWindowsSubstring = " has \(bus.amountOfWindows) windows and"
    }
    
    
    print("\(v.dynamicType)\(amountOfWindowsSubstring) needs \(v.travelDuration(100)) to travel 100 kilometers.")
}
**/