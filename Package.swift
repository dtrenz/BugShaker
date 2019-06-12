// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "BugShaker",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(name: "BugShaker", targets: ["BugShaker"]),
    ],
    targets: [
        .target(name: "BugShaker"),
        .testTarget(name: "BugShakerTests", dependencies: ["BugShaker"]),
    ]
)
