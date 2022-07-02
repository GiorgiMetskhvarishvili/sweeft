import UIKit

var greeting = "Hello, playground"


//1.     დაწერეთ ფუნქცია, რომელსაც გადაეცემა ტექსტი  და აბრუნებს პალინდრომია თუ არა. (პალინდრომი არის ტექსტი რომელიც ერთნაირად იკითხება ორივე მხრიდან).


 func isPalindrome(word: String) -> Bool {
    let word = word.lowercased().filter { $0 != " " }
    return word == String(word.reversed())
}

isPalindrome(word: "dsasd")



func palindromeOrNot(inputString: String) -> Bool {
    let characters = Array(inputString)
    var currentCh = 0
    
    if inputString.count < 2 {
        return false
    }
    while currentCh < characters.count / 2 {
        if characters[currentCh] != characters[characters.count - currentCh - 1]{
            return false
        }
        currentCh += 1
    }
    
    return true
}


palindromeOrNot(inputString: "madam")



//2.     გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში) და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.

var arr = [1,5,10,20,50]
 
var coinsArray = arr.sorted(by: <)

func minQuantiTyOfCoins(money : Int) -> Int {
   var sumOfCoins = 0
    var temp = money
    for index in stride(from: coinsArray.count - 1, to: -1, by: -1) {
        
        if temp  % coinsArray[index] == 0 || index == 0{
            if(index == 0){
                sumOfCoins += temp
            }else{
                sumOfCoins += temp / coinsArray[index]
            }
            break
        }
        
        if temp > coinsArray[index] && temp % coinsArray[index] > 0{
            sumOfCoins += temp / coinsArray[index]
            temp = temp - (coinsArray[index] * (temp / coinsArray[index]))
        }
        

    }
    return sumOfCoins
}

minQuantiTyOfCoins(money: 298)

func getCount (number : Int) -> Int {
    var i = 0
    var n = number
    
    while (n != 0){
        if(n >= 50){
            n -= 50
        }else if (n >= 20){
            n -= 20
        }else if (n >= 10){
            n -= 10
        }else if ((n / 5) != 0){
            n -= 5
        }else{
            n -= 1
        }
        i += 1
    }
    return i
}

getCount(number: 137)


//3. მოცემულია მასივი, რომელიც შედგება მთელი რიცხვებისგან. დაწერეთ ფუნქცია რომელსაც გადაეცემა ეს მასივი და აბრუნებს მინიმალურ მთელ რიცხვს, რომელიც 0-ზე მეტია და ამ მასივში არ შედის.


func notContain(array : [Int]) -> Int {
    var counter = [Int: Bool]()
    
    for i in array {
        counter[i] = true
    }

    print(counter)

    var i = 1
    while true {
        if counter[i] == nil {
            return i
        } else {
            i += 1
        }
    }
}

notContain(array: [1,2,3, 10])

//მოცემულია String რომელიც შედგება „(„ და „)“ ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.



func isBalanced(_ string: String) -> Bool {
    var balance = 0
    for i in string {
        if i == "(" {
            balance += 1
        } else if i == ")" {
            balance -= 1
        }
    }
    let result = (balance == 0)
    return result
}

isBalanced(")((()))")



//5.     გვაქვს n სართულიანი კიბე, ერთ მოქმედებაში შეგვიძლია ავიდეთ 1 ან 2 საფეხურით. დაწერეთ ფუნქცია რომელიც დაითვლის n სართულზე ასვლის ვარიანტების რაოდენობას.


func climbStairs(_ n: Int) -> Int {
    var zero = 1, one = 1, step = 2
    while step <= n {
        let temp = zero + one
        zero = one
        one = temp
        step += 1
    }
    return one
}

climbStairs(6)





//6.დაწერეთ საკუთარი მონაცემთა სტრუქტურა, რომელიც საშუალებას მოგვცემს O(1) დროში წავშალოთ ელემენტი.

class MyDataStructure {
    
    var numToIndex: [Int: Int]
    var nums: [Int]

    init() {
        numToIndex = [Int: Int]()
        nums = [Int]()
    }

    func insert(_ val: Int) -> Bool {
        if let _ = numToIndex[val] {
            return false
        } else {
            numToIndex[val] = nums.count
            nums.append(val)
            
            return true
        }
    }
    
    func remove(_ val: Int) -> Bool {
        if let index = numToIndex[val], let last = nums.last {
            numToIndex[last] = index
            numToIndex[val] = nil
            
            nums.swapAt(index, nums.count - 1)
            nums.removeLast()
            
            return true
        } else {
            return false
        }
    }
}

var myDataStructure = MyDataStructure()


myDataStructure.insert(1)
myDataStructure.insert(2)
myDataStructure.insert(3)
myDataStructure.insert(4)

myDataStructure.remove(4)


myDataStructure
