// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "MacFanControl",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "MacFanControl", targets: ["MacFanControl"])
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "MacFanControl",
            dependencies: [],
            swiftSettings: [
                .unsafeFlags(["-enable-bare-slash-regex"])
            ]
        )
    ]
)
