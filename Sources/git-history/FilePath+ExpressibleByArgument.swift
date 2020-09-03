
import ArgumentParser
import GitKit

extension FilePath: ExpressibleByArgument {

    public init(argument: String) {
        self.init(stringLiteral: argument)
    }
}
