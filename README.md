# Hive + Riverpod CRUD with Localization 🌍

A simple Flutter app demonstrating **persistent CRUD operations** using **Hive** for local storage and **Riverpod** for state management. This updated version includes full support for **localization** and **internationalization (i18n)**.


-----

## **Features** ✨

  * **Multi-language support** with localization.
  * Add, edit, and delete todos.
  * Persistent storage with **Hive**.
  * Reactive UI using **Riverpod**.
  * Clean project structure with distinct layers for models, repositories, providers, and pages.

-----

## **Localization**

This app is localized for the following languages:

  * 🇬🇧 **English (en)**
  * 🇪🇸 **Spanish (es)**
  * 🇧🇷 **Brazilian Portuguese (br)**

The localization is managed using the official `flutter_gen` and `intl` packages, storing strings in **.arb** (Application Resource Bundle) files.

-----

## **Folder Structure** 📁

```
lib/
├── l10n/
│   ├── intl_en.arb
│   ├── intl_es.arb
│   └── intl_pt.arb
├── main.dart
├── models/
│   ├── todo.dart
│   └── todo.g.dart
├── repositories/
│   └── todo_repository.dart
├── providers/
│   └── todo_provider.dart
└── pages/
    ├── home_page.dart
    └── todo_form_page.dart
```

  * **l10n/** → Contains localization resource files.
  * **models/** → Hive data models.
  * **repositories/** → Handles data operations (CRUD).
  * **providers/** → State management with Riverpod.
  * **pages/** → UI pages.

-----

## **Getting Started** 🚀

### **1. Prerequisites**

  * Flutter SDK installed
  * Dart SDK installed
  * Android Studio or VS Code with Flutter extension

### **2. Clone the repository**

```bash
git clone https://github.com/marcus-exe/hive_app.git
cd hive_app
```

### **3. Install dependencies**

```bash
flutter pub get
```

### **4. Generate Hive Adapters & Localization Files**

```bash
flutter pub run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

> **Note**: These commands generate the necessary `todo.g.dart` file for Hive and the localization files for translations.

### **5. Run the app**

```bash
flutter run
```

-----

## **Packages Used** 📦

  * [Hive](https://pub.dev/packages/hive) → Lightweight NoSQL database.
  * [Hive Flutter](https://pub.dev/packages/hive_flutter) → Hive integration for Flutter.
  * [Flutter Riverpod](https://pub.dev/packages/flutter_riverpod) → A robust state management solution.
  * [Flutter Localizations](https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html) → Flutter's built-in localization package.
  * [intl](https://pub.dev/packages/intl) → Dart's official internationalization package.

-----

## **Usage**

1.  Tap the **+ button** to add a new todo.
2.  Tap on a todo to **edit**.
3.  Tap the **trash icon** to **delete**.
4.  The app's language will change automatically based on your device's language settings.

-----

## **Project Architecture** 🏛️

  * **Clean Architecture**:

      * **Models** → Data representation.
      * **Repositories** → Handles Hive operations.
      * **Providers** → Manages app state (Riverpod).
      * **Pages** → UI components.

  * **Benefits**:

      * Clear separation of concerns.
      * Easy to maintain and extend with new features.
      * Reactive UI updates.

-----

## **Screenshots** 📸


Home | Add | List
:---:|:---:|:---:
<img src="./docs/Home.png" width="250"/> | <img src="./docs/Add.png" width="250"/> | <img src="./docs/List.png" width="250"/>


-----

## **Future Improvements** 💡

  * Add **search/filter** functionality.
  * Integrate with a **remote backend**.
  * Implement **authentication**.
  * Add **unit and widget tests**.

-----

## **License**

This project is open-source and available under the MIT License.
