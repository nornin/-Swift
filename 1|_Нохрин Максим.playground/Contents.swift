import UIKit

import Foundation

var a = 5.0;
var b = 10.0;
var c = 3.0;

var d = pow(b, 2) - 4 * a * c // дискриминант
var xOne: Double
var xTwo: Double


xOne = (-1 * b + pow(d, 0.5)) / (2 * a)
xTwo = (-1 * b - pow(d, 0.5)) / (2 * a)

print("Корни квадратного уравнения \(a)x^2+(\(b))x+(\(c)) равны:\nx первое = \(xOne), x второе = \(xTwo)")
