## 🚀 Deploy

This section covers how to build release versions of the app for publishing on the **Google Play Store** (Android) and the **Apple App Store** (iOS), including code obfuscation and symbol management.

---

### 📦 Android

To generate a release build optimized for distribution on the Play Store, run:

```bash
flutter build appbundle --release --obfuscate --split-debug-info=./build/app/symbols
```

#### 🔍 Explanation:

* `flutter build appbundle`:
  Generates a **.aab (Android App Bundle)** file, which is the preferred format for publishing apps on the Play Store.

* `--release`:
  Compiles the app in **release mode**, which enables optimizations and removes debugging info.

* `--obfuscate`:
  Obfuscates Dart code to make reverse engineering more difficult.

* `--split-debug-info=./build/app/symbols`:
  Separates debug symbols from the obfuscated code. This creates symbol files that can later be used to:

  * De-obfuscate stack traces in crash reports.
  * Maintain performance while improving security.

> 📁 The generated `.aab` file will be located at:
> `build/app/outputs/bundle/release/app-release.aab`

<br>
_The `.aab` cannot be installed via adb, so if you need to test your app, use_ :

```bash
flutter build apk --release
```

#### 📝 Before You Publish:

* Set up signing in `android/app/build.gradle`.
* Test the release build thoroughly.
* Upload the `.aab` to the **Google Play Console**.

---

### 🍏 iOS

To generate a release `.ipa` file for TestFlight or App Store distribution, run:

```bash
flutter build ipa --release --obfuscate --split-debug-info=./build/app/symbols
```

#### 🔍 Explanation:

* `flutter build ipa`:
  Builds an **iOS archive (.ipa)** for deployment via TestFlight or App Store.

* `--release`:
  Enables optimizations and disables debugging tools for production readiness.

* `--obfuscate`:
  Obfuscates Dart symbols to protect the app from reverse engineering.

* `--split-debug-info=./build/app/symbols`:
  Stores debug symbol files separately for de-obfuscating crash logs later.

> 📁 The resulting `.ipa` will be available at:
> `build/ios/ipa/Runner.ipa`

#### 📝 Before You Publish:

* Open the project in **Xcode** to set up:

  * Code signing
  * Team and provisioning profile
* Archive and validate your build via **Xcode Organizer** or upload directly using **Transporter** or `xcrun altool`.
* Make sure to test with **TestFlight** before final release.

---

### 🧠 Notes on Obfuscation & Debug Symbols

Using `--obfuscate` and `--split-debug-info` together ensures that:

* Your code is protected from reverse engineering.
* You still retain the ability to interpret crash reports by using the symbol files.
* Symbol files should be **safely stored**, not shipped with the app.

> ✅ Recommended:
> Upload your symbol files to your crash reporting service (e.g. Firebase Crashlytics or Sentry) to enable symbolication of stack traces.
