import UIKit

func addN(_ param1 : Int) -> ((Int) -> Int) {
    let result = {(_ param2 : Int) -> Int in
        return(param1 + param2)}
    return result
}

func applyToTwo(_ f: (Int) -> Int) -> Int {
    return f(2)
}

let addToSeven = addN(7)
print(applyToTwo(addToSeven))

