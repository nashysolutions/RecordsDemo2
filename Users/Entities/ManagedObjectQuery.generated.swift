// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// sourcery:inline:User.ManagedObjectQuery.stencil
public extension User {
    struct Query {
        public var identifier: Int64?
        public var title: StringParameter?
        public var isComplete: Bool?

        public init(identifier: Int64? = nil, title: StringParameter? = nil, isComplete: Bool? = nil) {
          self.identifier = identifier
          self.title = title
          self.isComplete = isComplete
        }
    }
}

extension User.Query: QueryGenerator {

    public typealias Entity = User

    public var predicateRepresentation: NSCompoundPredicate? {
      var predicates = [NSPredicate]()
      if let predicate = identifierPredicate() {
        predicates.append(predicate)
      }
      if let predicate = titlePredicate() {
        predicates.append(predicate)
      }
      if let predicate = isCompletePredicate() {
        predicates.append(predicate)
      }
      if predicates.count == 0 {
        return nil
      }
      return NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
    }

    private func identifierPredicate() -> NSPredicate? {
      guard let identifier = identifier else { return nil }
      return NSPredicate(format: "identifier == %lld", identifier)
    }
    private func titlePredicate() -> NSPredicate? {
      guard let title = title else { return nil }
      let value = "title" + " " + title.predicateFormat + " %@"
      return NSPredicate(format: value, title.candidate)
    }
    private func isCompletePredicate() -> NSPredicate? {
      guard let isComplete = isComplete else { return nil }
      return NSPredicate(format: "isComplete == %@", isComplete as CVarArg)
    }
}
// sourcery:end
