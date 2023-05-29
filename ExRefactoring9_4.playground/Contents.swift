import UIKit

enum Beer {
    case hoganda
    case hite
    case heineken
}

let beer = Beer.hite
var price = 0
var taxFee = 0
var primium = false

switch beer {
case .hoganda:
    print("this is hoganda")
    price = 1000
    taxFee = 300
case .hite:
    print("this is hite")
    price = 500
case .heineken:
    print("this is heineken")
    price = 2000
    if primium {
        taxFee = 1000
    } else {
        taxFee = 500
    }
}

let result = price + taxFee
print("result:", result) // 500

/*
다형성으로 Refactoring
 */

class MyBeer {
    func getPrice() -> Int {
        0
    }
    func getTax() -> Int {
        0
    }
    func total() -> Int {
        getPrice() + getTax()
    }
}

class Hoganda: MyBeer {
    init?(beer: Beer) {
        guard beer == .hoganda else { return nil }
        print("this is hoganda")
    }
    
    override func getPrice() -> Int {
        1000
    }
    override func getTax() -> Int {
        300
    }
}

class Hite: MyBeer {
    init?(beer: Beer) {
        guard beer == .hite else { return nil }
        print("this is hite")
    }
    
    override func getPrice() -> Int {
        500
    }
}

class Heineken: MyBeer {
    private let primium: Bool
    
    init?(beer: Beer, primium: Bool) {
        guard beer == .heineken else { return nil }
        print("this is heineken")
        self.primium = primium
    }
    
    override func getPrice() -> Int {
        2000
    }
    override func getTax() -> Int {
        primium ? 1000 : 500
    }
}

enum BeerBuilder {
    static func createBeer(_ beerType: Beer) -> MyBeer? {
        switch beerType {
        case .hoganda:
            return Hoganda(beer: beer)
        case .hite:
            return Hite(beer: beer)
        case .heineken:
            return Heineken(beer: beer)
        default:
            return nil
        }
    }
}
