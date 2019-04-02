# stash

Super simple iOS persistence.

## Example

```swift
let firstLaunch = Stash.get("firstLaunch") ?? true

Stash.set("firstLaunch", false)

struct Dog : Codable {
    var name: String
    var age: Int
}

var dogs = Stash.read(Dog.self)

dogs.append(Dog(name: "Foo", age: 7))
dogs.append(Dog(name: "Bar", age: 3))

Stash.write(dogs)
```
