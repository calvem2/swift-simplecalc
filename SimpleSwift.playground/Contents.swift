import Foundation

print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    // handle count, avg, factorial
    switch args[args.count - 1] {
    case "count":
        return args.count - 1
    case "avg":
        var total = 0
        let count = args.count - 1
        for n in 0...count {
            total += Int(args[n]) ?? 0
        }
        return count != 0 ? total / count : 0
    case "fact":
        let num = Int(args[0]) ?? -1
        if num == -1 {
            return 0
        } else if num == 0 {
            return 1
        }
        var fact = 1;
        for n in 1...num {
            fact *= n
        }
        return fact
    default:
        break
    }
    
    // handle expressions
    var operation = "+"
    var value = 0
    for arg in args {
        if arg == "+" || arg == "-" || arg == "*" || arg == "/" || arg == "%" {
            operation = arg
        } else {
            switch operation {
            case "+":
                value += Int(arg) ?? 0
            case "-":
                value -= Int(arg) ?? 0
            case "*":
                value *= Int(arg) ?? 1
            case "/":
                value /= Int(arg) ?? 1
            case "%":
                let num = Int(arg) ?? nil
                if num != nil {
                    value %= num!
                }
            default:
                break
            }
        }
    }
    return value;
}

func calculate(_ arg: String) -> Int {
    return calculate(arg.components(separatedBy: " "))
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

 
// Implement calculate([String]) and calculate(String)
// to use floating-point values
/*
func calculate(_ args: [String]) -> Double {
    return -1.0
}
func calculate(_ arg: String) -> Double {
    return -1.0
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5
*/
