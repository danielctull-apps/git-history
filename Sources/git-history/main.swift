
import ArgumentParser
import Foundation
import GitKit

struct GitHistory: ParsableCommand {

    @Option(name: [.short, .long], help: "The file to open.")
    var file: FilePath

    @Option(name: [.short, .long], help: "The line number to inspect.")
    var line: LineNumber

    func run() throws {
        let path = FileManager.default.currentDirectoryPath
        let url = URL(fileURLWithPath: path)
        let repo = try Repository(url: url)
        let blame = try repo.blame(for: file)
        let hunk = try blame.hunk(for: line)
        let commit = try repo.commit(for: hunk.commitID)
        print("\(commit.id.shortDescription): Lines \(hunk.lines) by \(commit.author.name)")
    }
}

GitHistory.main()
