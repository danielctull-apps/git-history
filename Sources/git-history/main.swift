
import ArgumentParser
import Foundation
import GitKit

struct GitHistory: ParsableCommand {

    func run() throws {
        let path = FileManager.default.currentDirectoryPath
        let url = URL(fileURLWithPath: path)
        let repo = try Repository(url: url)
        print(repo)
        let commits = try repo.commits()
        print(commits)
    }
}

GitHistory.main()
