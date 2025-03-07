// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "cardboard",
  platforms: [.iOS(.v12)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "cardboard",
      targets: ["cardboard"]
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
      name: "cardboard",
      dependencies: ["protobufcpp"],
      path: "sdk",
      exclude: [
        "build.gradle",
        "rendering/android/shaders/distortion.frag",
        "qrcode/android/java/com/google/cardboard/sdk/qrcode/camera/CameraSourcePreview.java",
        "screen_params/android/java/com/google/cardboard/sdk/screenparams/ScreenParamsUtils.java",
        "qrcode/android/java/com/google/cardboard/sdk/qrcode/QrCodeContentProcessor.java",
        "qrcode/android/java/com/google/cardboard/sdk/qrcode/QrCodeTracker.java",
        "qrcode/android/res/values/styles.xml",
        "qrcode/android/res/drawable-xxhdpi/tick_marks.png",
        "qrcode/android/res/drawable-xxhdpi/qr_sample.png",
        "qrcode/android/java/com/google/cardboard/sdk/qrcode/UrlFactory.java",
        "qrcode/android/res/values/strings.xml",
        "qrcode/android/java/com/google/cardboard/sdk/qrcode/OutputStreamProvider.java",
        "qrcode/android/java/com/google/cardboard/sdk/QrCodeCaptureActivity.java",
        "qrcode/android/java/com/google/cardboard/sdk/qrcode/CardboardParamsUtils.java",
        "cardboard_api.lds",
        "device_params/android/java/com/google/cardboard/sdk/deviceparams/DeviceParamsUtils.java",
        "qrcode/android/java/com/google/cardboard/sdk/qrcode/InputStreamProvider.java",
        "CMakeLists.txt",
        "qrcode/android/java/com/google/cardboard/sdk/HeadsetDetectionActivity.java",
        "rendering/android/shaders/distortion.vert",
        "qrcode/android/java/com/google/cardboard/sdk/qrcode/camera/CameraSource.java",
        "qrcode/android/res/layout/qr_code_capture.xml",
        "qrcode/android/AndroidManifest.xml",
        "rendering/android/shaders/distortion_frag.spv",
        "device_params/android/java/com/google/cardboard/sdk/deviceparams/CardboardV1DeviceParams.java",
        "proguard-rules.pro",
        "qrcode/android/java/com/google/cardboard/sdk/qrcode/QrCodeTrackerFactory.java",
        "qrcode/android/res/values/colors.xml",
        "rendering/android/shaders/distortion_vert.spv",
        "qrcode/ios/sdk.bundle",
      ],
      cxxSettings: [
        .headerSearchPath("proto"),
        .headerSearchPath("third_party/unity_plugin_api"),

        .unsafeFlags([
          "-std=c++11",
        ]),
      ],
      linkerSettings: [
        .linkedFramework("MetalKit"),
        .linkedFramework("Metal"),
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
  ]
)
