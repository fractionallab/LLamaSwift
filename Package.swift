// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LLamaSwift",
    platforms: [
        .macOS(.v12),
        .iOS(.v14),
        .watchOS(.v4),
        .tvOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "LLamaSwift",
            targets: ["LLamaSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.1"),
    ],
    targets: [
        .target(
            name: "LLamaSwift",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .target(name: "llama")
            ]
        ),
        .binaryTarget(name: "llama", path: "Frameworks/llama.xcframework"),
        .testTarget(
            name: "llama-cpp-swiftTests",
            dependencies: ["LLamaSwift"]
        ),
    ]
)
