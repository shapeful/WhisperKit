// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "whisperkit",
    platforms: [
        .iOS(.v16),
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "WhisperKit",
            targets: ["WhisperKit"]
        ), 
    ],
    dependencies: [
        .package(url: "https://github.com/huggingface/swift-transformers.git", from: "0.1.17")
       ],
    targets: [
        .target(
            name: "WhisperKit",
            dependencies: [
                .product(name: "Transformers", package: "swift-transformers"),
            ]
        ),
        .testTarget(
            name: "WhisperKitTests",
            dependencies: [
                "WhisperKit",
                .product(name: "Transformers", package: "swift-transformers"),
            ],
            path: ".",
            exclude: [
                "Examples",
                "Sources",
                "Makefile",
                "README.md",
                "LICENSE",
                "CONTRIBUTING.md",
            ],
            resources: [
                .process("Tests/WhisperKitTests/Resources"),
                .copy("Models/whisperkit-coreml"),
            ]
        ),
    ]
)
