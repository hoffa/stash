import UIKit

struct Stash {
    static func jsonEncode<T>(_ value: T) -> String? where T : Encodable {
        guard let data = try? JSONEncoder().encode(value) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }

    static func jsonDecode<T>(_ json: String, as type: T.Type) -> T? where T : Decodable {
        guard let data = json.data(using: .utf8) else {
            return nil
        }
        return try? JSONDecoder().decode(type, from: data)
    }

    static func read<T>(_ type: T.Type) -> [T] where T : Codable {
        let key = String(describing: type)
        if let json = UserDefaults.standard.string(forKey: key) {
            if let values = jsonDecode(json, as: [T].self) {
                return values
            }
        }
        return []
    }
    
    static func write<T>(_ values: [T]) where T : Codable {
        if let json = jsonEncode(values) {
            let key = String(describing: T.self)
            UserDefaults.standard.set(json, forKey: key)
        }
    }
}
