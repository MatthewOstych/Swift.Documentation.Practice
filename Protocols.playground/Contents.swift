//MARK: - Protocols

protocol RouterDelegate: AnyObject {
    var nameIDs: [String] { get set }
    func saveName(name: String, text: String)
}

protocol UsersProtocol {
    var name: String { get set }
    var age: Int { get set }
    var delegate: RouterDelegate? { get set }
    
    init(name: String, age: Int, delegate: RouterDelegate?)
}

//MARK: - Classes

class Router: RouterDelegate {
    var nameIDs: [String] = []
    
    func saveName(name: String, text: String) {
        nameIDs.append(name)
        nameIDs.append(text)
    }
}

class User: UsersProtocol {
    var name: String
    var age: Int
    weak var delegate: RouterDelegate?
    
    func sendMail(name: String, text: String) -> Bool {
        delegate?.saveName(name: name, text: text)
        return true
    }
    
    required init(name: String, age: Int, delegate: RouterDelegate?) {
        self.name = name
        self.age = age
        self.delegate = delegate
    }
}
