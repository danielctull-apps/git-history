// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "git-history",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
    ],
    products: [
        .executable(name: "git-history", targets: ["git-history"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "0.3.0"),
        .package(url: "https://github.com/danielctull/GitKit.git", .branch("main")),
    ],
    targets: [
        .target(name: "git-history", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
            .product(name: "GitKit", package: "GitKit"),
        ]),
    ]
)
