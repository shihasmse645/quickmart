# QuickMart

A modern, high-performance e-commerce mobile application built with **Flutter**. QuickMart strictly follows a **Feature-First Clean Architecture** and uses **BLoC** for predictable state management, ensuring scalability, maintainability, and a seamless user experience.

## ✨ Features

- **Robust Architecture**: Structured into `core` and distinct `features` (Auth, Dashboard, Cart) following Clean Architecture principles (Domain, Data, Presentation).
- **State Management**: Powered by `flutter_bloc` for decoupled, testable, and reactive state across the app.
- **Dependency Injection**: Scalable service location using `get_it`.
- **Authentication**: Functional login flow with token persistence using `shared_preferences`.
- **Dynamic Dashboard**: 
  - Custom `SliverAppBar` that intelligently collapses search and location fields while pinning critical actions (Cart, Logout).
  - Promotional banners using `carousel_slider`.
  - Shimmer loading effects for a premium feel.
- **Global Cart Management**: 
  - Add to cart, adjust quantities, and calculate totals in real-time.
  - Floating cart button for quick access.
  - Dedicated cart screen with a sticky checkout bar.
- **API Integration**: Ready for backend communication via `dio`.
- **Custom Assets**: Polished typography with `google_fonts` and custom platform-specific app icons generated via `flutter_launcher_icons`.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: Dart
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it)
- **Networking**: [dio](https://pub.dev/packages/dio)
- **Local Storage**: [shared_preferences](https://pub.dev/packages/shared_preferences)
- **Utilities**: `equatable`, `shimmer`, `carousel_slider`, `google_fonts`

## 📂 Project Structure

```text
lib/
├── core/
│   ├── di/               # Dependency injection setup (service_locator.dart)
│   ├── network/          # Network clients and interceptors
│   ├── theme/            # App colors, text themes, and global styles
│   └── usecase/          # Base use case definitions
└── features/
    ├── auth/             # Authentication feature (Login UI, AuthBloc)
    ├── cart/             # Cart feature (CartBloc, Models, Entities, UI)
    └── dashboard/        # Dashboard feature (Product listing, Custom Appbar)
```

Inside each feature, the architecture is divided into:
- `domain/`: Business logic, Entities, Use Cases, and Repository Interfaces.
- `data/`: API integration, Models, and Repository Implementations.
- `presentation/`: Pages, UI Widgets, and BLoC components (Events/States).

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart SDK
- Android Studio, VS Code, or your preferred IDE.

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/shihasmse645/QuickMart.git
   ```

2. **Navigate to the project directory**
   ```bash
   cd quikmart
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

