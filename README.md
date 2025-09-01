✨ WELCOME ABOARD! ✨
By reading this documentation, you’ll be fully prepared to jump into the project, understand its structure, and maintain it with confidence.
We designed this architecture to be clean, scalable, and fun to work with.

Think of this doc as your quick tour guide 🚀 — once you go through it, you’ll know exactly where things live, how to name files,
and how to extend features without breaking a sweat.

Let’s build and maintain this project with excellence together 💪🔥

# PROJECT STRUCTURE DOCUMENTATION

This project follows **Clean Architecture** combined with **Atomic Design** for the presentation layer.

---

## DIRECTORY STRUCTURE

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

## FLAVORS & LAUNCH CONFIGURATIONS

This project is configured with multiple flavors for different environments:

### Available Flavors

- **Development** (`main_dev.dart`) - For development environment
- **Homologation** (`main_hmg.dart`) - For staging/testing environment
- **Production** (`main_prod.dart`) - For production environment

### Running the App

You can launch the app in different flavors using VS Code:

1. Open the **Run and Debug** panel (Ctrl/Cmd + Shift + D)
2. Select from the dropdown:
   - `base-app (dev)` - Development flavor
   - `base-app (hmg)` - Homologation flavor
   - `base-app (prod)` - Production flavor
3. Click the play button or press F5

Each flavor uses its corresponding entry point file in `lib/app/`.

---

## BENEFITS

- Clear separation of concerns
- Easy testing at each layer
- Reusable UI components
- Scalable feature-based structure
- Centralized global state
- Multi-environment support with flavors
