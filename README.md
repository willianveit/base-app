✨ WELCOME ABOARD! ✨
By reading this documentation, you’ll be fully prepared to jump into the project, understand its structure, and maintain it with confidence.
We designed this architecture to be clean, scalable, and fun to work with.

Think of this doc as your quick tour guide 🚀 — once you go through it, you’ll know exactly where things live, how to name files,
and how to extend features without breaking a sweat.

Let’s build and maintain this project with excellence together 💪🔥

# PROJECT STRUCTURE DOCUMENTATION

This project follows **Clean Architecture** combined with **Atomic Design** for the presentation layer.

---

## 📂 DIRECTORY STRUCTURE

```text
lib/
├── app/                     App setup, routes, DI, theme
├── core/                    Shared infrastructure (errors, network, usecases, utils)
├── shared/                  Global UI + state
│   └── presentation/
│       ├── bloc/            Global state (AppCubit)
│       └── atomic/          Atomic Design (atoms, molecules, organisms, templates, pages)
├── features/                Independent features
│   ├── auth/                Authentication feature
│   │   ├── domain/          Entities, repositories, usecases
│   │   ├── data/            Models, datasources, repository impl
│   │   └── presentation/    Bloc + Atomic UI
│   └── counter/             Counter feature (same structure as auth)
```

---

## NAMING CONVENTIONS

- Entities -> app_user.dart -> class AppUser
- Models -> app_user_model.dart -> class AppUserModel
- UseCases -> sign_in_usecase.dart -> class SignInUsecase
- Cubit/Bloc -> auth_cubit.dart -> class AuthCubit
- Atomic Design -> button_atom.dart, email_password_form_molecule.dart,
  login_form_organism.dart, auth_scaffold_template.dart, login_page.dart

---

## KEY CONCEPTS

CLEAN ARCHITECTURE

- Domain: business rules, independent of frameworks
- Data: implementation of repositories and datasources
- Presentation: UI + State Management

ATOMIC DESIGN

- Atoms: basic UI elements
- Molecules: simple combination of atoms
- Organisms: complex UI components
- Templates: page structure/layout
- Pages: concrete screens

---

## GLOBAL STATE

AppCubit (shared/presentation/bloc/app_cubit.dart) handles:

- Theme (light/dark)
- Localization (language)
- Global configurations

---

## BENEFITS

- Clear separation of concerns
- Easy testing at each layer
- Reusable UI components
- Scalable feature-based structure
- Centralized global state
- Multi-environment support with flavors

---

## 🚀 FLAVORS & LAUNCH CONFIGURATIONS

This project is configured with multiple flavors for different environments, each with its own configuration files, Firebase settings, and bundle identifiers.

### Available Flavors

- **Development** (`dev`) - For development environment

  - Entry point: `lib/app/main_dev.dart`
  - Bundle ID: `com.example.baseapp.dev`
  - Firebase config: `firebase_options_dev.dart`

- **Homologation** (`hmg`) - For staging/testing environment

  - Entry point: `lib/app/main_hmg.dart`
  - Bundle ID: `com.example.baseapp.hmg`
  - Firebase config: `firebase_options_hmg.dart`

- **Production** (`prod`) - For production environment
  - Entry point: `lib/app/main_prod.dart`
  - Bundle ID: `com.example.baseapp`
  - Firebase config: `firebase_options_prod.dart`

### Running the App with VS Code

The project includes a pre-configured `.vscode/launch.json` file with launch configurations for each flavor:

#### Using the Run and Debug Panel:

1. Open the **Run and Debug** panel (`Ctrl/Cmd + Shift + D`)
2. Select from the dropdown:
   - `base-app (dev)` - Development flavor
   - `base-app (hmg)` - Homologation flavor
   - `base-app (prod)` - Production flavor
3. Click the play button or press `F5`

#### Using Command Palette:

1. Open Command Palette (`Ctrl/Cmd + Shift + P`)
2. Type "Flutter: Launch Emulator" or "Flutter: Select Device"
3. Choose your target device
4. Use the Run and Debug panel to select the desired flavor

### Environment Configuration

Each flavor has its own environment configuration located in `lib/app/env/`:

- Development: Uses development API endpoints and debug settings
- Homologation: Uses staging API endpoints for testing
- Production: Uses production API endpoints and optimized settings

The app automatically detects the current environment and displays it on the home screen for easy identification during development and testing.

### Firebase/Google Services Configuration

**Important**: Each environment must have its own Firebase project and Google Services configuration files.

#### Setting up Firebase Projects

You need to create **separate Firebase projects** for each environment:

1. **Development Environment**:

   - Create a new Firebase project (e.g., "base-app-dev")
   - Add Android app with package name: `com.example.baseapp.dev`
   - Add iOS app with bundle ID: `com.example.baseapp.dev`

2. **Homologation Environment**:

   - Create a new Firebase project (e.g., "base-app-hmg")
   - Add Android app with package name: `com.example.baseapp.hmg`
   - Add iOS app with bundle ID: `com.example.baseapp.hmg`

3. **Production Environment**:
   - Create a new Firebase project (e.g., "base-app-prod")
   - Add Android app with package name: `com.example.baseapp`
   - Add iOS app with bundle ID: `com.example.baseapp`

#### Configuration Files Location

⚠️ **Important**: The Google Services configuration files are included in `.gitignore` for security reasons. You must manually add these files to your local project:

#### Android Configuration:

- **Development**: `android/app/src/dev/google-services.json`

  - Package name: `com.example.baseapp.dev`
  - Project ID: `base-app-dev-1756753470`

- **Homologation**: `android/app/src/hmg/google-services.json`

  - Package name: `com.example.baseapp.hmg`
  - Project ID: `base-app-hmg-1756753495`

- **Production**: `android/app/src/prod/google-services.json`
  - Package name: `com.example.baseapp`
  - Project ID: (configure with your production Firebase project)

#### iOS Configuration:

- **Development**: `ios/Runner/GoogleService-Info-dev.plist`

  - Bundle ID: `com.example.baseapp.dev`

- **Homologation**: `ios/Runner/GoogleService-Info-hmg.plist`

  - Bundle ID: `com.example.baseapp.hmg`

- **Production**: `ios/Runner/GoogleService-Info-prod.plist`
  - Bundle ID: `com.example.baseapp`

#### Setup Instructions

**Each developer must**:

1. Create their own Firebase projects for each environment (or get access to existing ones)
2. Download the configuration files from Firebase Console:
   - For Android: `google-services.json`
   - For iOS: `GoogleService-Info.plist`
3. Place them in the correct directories as shown above
4. **Never commit these files to the repository**

> **Security Note**: These configuration files contain sensitive API keys and should never be committed to version control. Each team member should obtain their own configuration files from the appropriate Firebase projects to ensure proper separation of data and analytics between environments.

---
