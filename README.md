# stash

Super simple iOS persistence.

## Example

```swift
struct Dog : Codable {
    var name: String
    var age: Int
}

var dogs = Stash.read(Dog.self)

dogs.append(Dog(name: "Foo", age: 7))
dogs.append(Dog(name: "Bar", age: 3))

Stash.write(dogs)
```
