
import ArgumentParser
import GitKit

extension LineNumber: ExpressibleByArgument {

    public init?(argument: String) {
        guard let integer = Int(argument) else { return nil }
        self.init(integerLiteral: integer)
    }
}
