# stash

Super simple iOS persistence.

## Usage

Read stored objects with `read<T>(T.Type) -> [T]` and write back with `write<T>([T])`. `T` must be [`Codable`](https://developer.apple.com/documentation/swift/codable).

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
