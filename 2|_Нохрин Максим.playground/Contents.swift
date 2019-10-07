import UIKit

var a = 5
var b = 7

var square = a * b / 2

var hypotenuse = pow((pow(Double(a), 2) + pow(Double(b), 2)), 0.5)

var perimeter = a + b + Int(hypotenuse)

print("Площадь прямоугольного треугольника с катетами \(a) и \(b) равна \(square), гипотенуза равна \(hypotenuse), периметр равен \(perimeter)")
