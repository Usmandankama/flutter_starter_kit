# 🚀 Flutter App Starter Template

A clean and scalable Flutter starter template designed to kickstart your next app with:

- 🔥 Firebase pre-configured (Auth, Firestore)
- ⚙️ GetX for state management, routing & dependency injection
- 🧱 Modular & maintainable folder structure
- 🌙 Built-in dark/light theme support
- 🧪 Ready for scaling with clean architecture principles

---

## 📦 What’s Included?

- Firebase integration (with setup instructions)
- GetX state management and routing
- Custom `AuthService` and `FirestoreService`
- Predefined folder architecture (`controllers/`, `screens/`, `widgets/`, `core/`, etc.)
- Light & dark theme switching
- Sample login/register screen
- Easy route handling and dependency injection
- Clean build system and up-to-date Gradle/Kotlin configuration

---

## 🛠 Setup Instructions

1. **Clone the repo**
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   cd YOUR_REPO_NAME

## 🔥 Firebase Setup

This starter kit supports Firebase Auth, Firestore, and Google Sign-In.

### Setup Steps

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project
3. Add Android & iOS apps and download config files:
   - `google-services.json` → place in `android/app/`
   - `GoogleService-Info.plist` → place in `ios/Runner/`
4. Run:
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
