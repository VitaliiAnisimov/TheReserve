import Cocoa

class Animal {
    var energy: Int
    var weight: Int
    var currentAge = 0
    var maxAge: Int
    var name: String
    var isTooOld: Bool {
        if currentAge >= maxAge{
            return true
        }else{
            return false
        }
    }
    
    init(energy:Int, weight: Int, maxAge: Int, name: String){
    self.energy = energy
    self.weight = weight
    self.maxAge = maxAge
    self.name = name

    }
    func tryIncrementAge(){
        if (Bool.random()){
        currentAge += 1
        }
    }
    func sleep(){
        self.energy += 5
        self.currentAge += 1
        print("\(name) спит")
    }
    func eat(){
        self.energy += 3
        self.weight += 1
        tryIncrementAge()
        print("\(name) ест")
    }
    func move(){
        self.energy -= 5
        self.weight -= 1
        tryIncrementAge()
        print("\(name) передвигается")
    }
    func birth() -> Animal {
        self.energy = Int.random(in: 1...10)
        self.weight = Int.random(in: 1...5)
        print("В заповеднике родился \(self.name), энергия - \(self.energy), весит - \(self.weight)")
            return self
    }
}
class Bird: Animal{
   override func move() {
        print("\(name) летит")
    }
    func birth(_ : Bird) -> Bird {
        return self
    }
}
class Fish: Animal{
    override func move() {
        print("\(name) плывет")
    }
    func birth(_ : Fish) -> Fish {
        return self
    }
}
class Dog: Animal{
    override func move() {
        print("\(name) бежит")
    }
    func birth(_ : Dog) -> Dog {
        return self

    }
}
class Snake: Animal{
    override func move() {
        print("\(name) ползет")
    }
    func birth(_ : Snake)-> Snake {
        return self
    }
}
class NatureReserve: Animal{
        var startAnimals = [Bird(energy: 5, weight: 3, maxAge: 10, name: "eagle"), Bird(energy: 8, weight: 5, maxAge: 8, name: "chicken"), Bird(energy: 4, weight: 2, maxAge: 9, name: "pigeon"), Bird(energy: 10, weight: 2, maxAge: 15, name: "kite"), Bird(energy: 1, weight: 1, maxAge: 10, name: "parrot"), Fish(energy: 5, weight: 5, maxAge: 15, name: "carp"), Fish(energy: 2, weight: 3, maxAge: 12, name: "roach"), Fish(energy: 4, weight: 4, maxAge: 20, name: "vobla"),Dog(energy: 5, weight: 3, maxAge: 11, name:"beagle"),Dog(energy: 2, weight: 4, maxAge: 13, name: "bulldog"), Animal(energy: 1, weight: 2, maxAge: 5, name: "rabbit"), Snake(energy: 5, weight: 1, maxAge: 4, name: "grass-snake")]
    
        func randomAction(){
        let random = Int.random(in: 1...4)
        switch random {
        case 1:
            super.move()
        case 2:
            super.eat()
        case 3:
            super.sleep()
        default:
            super.birth()
           startAnimals.append(birth())
        }
        }
    
        var i = 0
            func iteration(numberIteration: Int){
                while i < numberIteration {
                    for _ in startAnimals {
            if isTooOld == true {
              startAnimals.removeAll(where: {$0.isTooOld})
            } else if isTooOld != true {
                randomAction()
            }
        }
           i+=1 }
    if startAnimals.count > 0 {
        print ("В заповеднике осталось \(startAnimals.count) животных")
    } else {
        print ("Все умерли")
    }
    }
    }
var natureReserve = NatureReserve(energy: 10, weight: 10, maxAge: 10, name: "eagle")
natureReserve.iteration(numberIteration: 10)
