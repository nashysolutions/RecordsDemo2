import Foundation
import Records

struct JSONUser {
    let userId: Int
    let id: Int64
    let title: String
    let completed: Bool
}

extension JSONUser: Codable {}

extension JSONUser: Recordable {
    
    var primaryKey: User.Query {
        User.Query(identifier: id)
    }
    
    func update(record: User) {
        record.identifier = id
        record.title = title.capitalized
        record.isComplete = completed
    }
}

extension JSONUser: Procurable {
    
    static let json: URL = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    
    private static let request = URLRequest(url: json)
    
    private static func fetch(_ completion: @escaping ([JSONUser]) -> Void) {
        URLSession.shared.dataTask(with: request) { data,_,_ in
            var items: [Self] = []
            defer { DispatchQueue.main.async { completion(items) } }
            guard let data = data else { return }
            items = (try? decoder.decode([Self].self, from: data)) ?? []
        }.resume()
    }
        
    static func procure(_ completion: @escaping ([JSONUser]) throws -> Void) throws {
        fetch { items in
            try? completion(items)
        }
    }
}
