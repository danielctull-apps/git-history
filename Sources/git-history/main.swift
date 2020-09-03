
import ArgumentParser
import Foundation
import GitKit

struct GitHistory: ParsableCommand {

    @Argument(help: "The file to open.")
    var file: FilePath

    func run() throws {
        let path = FileManager.default.currentDirectoryPath
        let url = URL(fileURLWithPath: path)
        let repo = try Repository(url: url)
        let blame = try repo.blame(for: file)
        let hunks = try blame.hunks()
        for hunk in hunks {
            let commit = try repo.commit(for: hunk.commitID)
            print("\(commit.id.shortDescription): Lines \(hunk.lines) by \(commit.author.name)")
        }
    }
}

GitHistory.main()
