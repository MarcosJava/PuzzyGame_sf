user:fmarcos (Marcos, Felipe)

#  NOTES ABOUT COURSE

## CountableRange.
CountableRange just can do it with stride(from:through:by:)
Like this : 
for i in stride(from: 0.5, through: 15.25, by:0.3) { .. }

It doesnt exist: 
for ( i = 0.5; i <= 15.25; i += 0.3) { ... }
because its stride by Int.

## Tuples
Its group of values ... 
let x: (String, Int, Double) = ("Hello", 5, 5.6)

Tuples are excelent for return multiple values. 
func getSize() -> (weight: Double, height: Double)
let x = getSize()
You can use x.weight and x.height

## Computed Properties
You can intercept simple get/set value with Computed Properties 

var foo: Double << this is default get and set .  

var foo: Double {
    get {
        // you can intercept return.
    }
    set (newValue) {
        // you can do something here.
    }
}

