// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Hash",
    products: [
        .library(
            name: "Hash",
            targets: ["Hash"])
    ],
    targets: [
        .target(
            name: "Hash",
            path: "Hash/Classes")
    ]
)
