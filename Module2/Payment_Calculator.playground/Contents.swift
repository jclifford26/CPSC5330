import UIKit

func Payment(loanAmount : Int, numberOfPayments: Int, interestRate: Float) -> Float {
    let P = Float(loanAmount)
    let r = interestRate / 100.0
    let n = Float(numberOfPayments)
    
    let numerator = r * pow(1 + r, n)
    let denominator = pow(1 + r, n) - 1
    let payment = P * numerator / denominator
    
    return payment
}

let scenerio1 = 4.4 / 12
let payment1 = Payment(loanAmount: 20000, numberOfPayments: 2, interestRate: Float(scenerio1))
print("Scenerio 1 has a monthly payment of:", payment1)

let scenerio2 = 5.0
let payment2 = Payment(loanAmount: 150000, numberOfPayments: 30, interestRate: Float(scenerio2))
print("Scenerio 2 has an annual payment of:", payment2)
