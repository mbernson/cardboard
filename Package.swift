// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "cardboard",
  platforms: [.iOS(.v12)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "cardboard_api",
      targets: ["cardboard_api"]
    ),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "cardboard_api",
      dependencies: ["protobufcpp", "unity_plugin_api"],
      path: "sdk",
      exclude: [
        "build.gradle",
        "cardboard_api.lds",
        "CMakeLists.txt",
        "proguard-rules.pro",

        "unity/xr_unity_plugin/renderer.h",

        "device_params/android",
        "unity/android",
        "screen_params/android",
        "sensors/android",
        "qrcode/android",
        "rendering/android",
      ],
      resources: [.copy("qrcode/ios/sdk.bundle")],
//      publicHeadersPath: "sdk/include",
      cxxSettings: [
        .headerSearchPath("."),
        .headerSearchPath("proto"),
//        .headerSearchPath("third_party/unity_plugin_api"),

        .define("GLES_SILENCE_DEPRECATION"),

        .unsafeFlags([
          "-std=c++17",
        ]),
      ],
      linkerSettings: [
        .linkedFramework("MetalKit"),
        .linkedFramework("Metal"),
//        .unsafeFlags(["-ObjC"]),
      ]
    ),

    .target(
      name: "protobufcpp",
      dependencies: [],
      path: "third_party/Protobuf-C++",
      exclude: [
        "src/google/protobuf/wire_format_unittest.inc",
        "src/google/protobuf/message_unittest.inc",
        "src/google/protobuf/proto3_lite_unittest.inc",
        "README.md",
        "LICENSE",
        "src/google/protobuf/port_def.inc",
        "src/google/protobuf/test_util.inc",
        "src/google/protobuf/generated_message_tctable_impl.inc",
        "src/google/protobuf/port_undef.inc",
      ],
      cxxSettings: [
        .headerSearchPath("src"),

        .define("HAVE_PTHREAD", to: "1"),

        .unsafeFlags([
          "-std=c++11",
        ]),
      ],
      linkerSettings: [
        .linkedLibrary("pthread"),
      ]
    ),

    .target(
      name: "unity_plugin_api",
      dependencies: [],
      path: "third_party/unity_plugin_api",
      exclude: [
//          "src/google/protobuf/wire_format_unittest.inc",
//          "src/google/protobuf/message_unittest.inc",
//          "src/google/protobuf/proto3_lite_unittest.inc",
//          "README.md",
//          "LICENSE",
//          "src/google/protobuf/port_def.inc",
//          "src/google/protobuf/test_util.inc",
//          "src/google/protobuf/generated_message_tctable_impl.inc",
//          "src/google/protobuf/port_undef.inc",
      ],
      sources: ["."],
      publicHeadersPath: ".",
      cSettings: [
        .headerSearchPath("."),
      ],
      cxxSettings: [
        .headerSearchPath("."),

//          .define("HAVE_PTHREAD", to: "1"),

        .unsafeFlags([
          "-std=c++11",
        ]),
      ],
      linkerSettings: [
        .linkedLibrary("pthread"),
      ]
    ),
  ]
)
