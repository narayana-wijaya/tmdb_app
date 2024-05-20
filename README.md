# TMDB Flutter Application

## Getting Started

This Flutter project demonstrates the implementation of the repository pattern alongside the GetX library for state management. The repository pattern helps in separating concerns and promoting a clean architecture, while GetX provides a simple yet powerful state management solution.

## Features

- **Repository Pattern**: The project utilizes the repository pattern to abstract data sources and provide a clean API for data access.
- **GetX Library**: GetX is used for state management, navigation, and dependency injection, offering a lightweight and highly performant solution.
- **Clean Architecture**: The project is structured following clean architecture principles, ensuring separation of concerns and maintainability.

## Requirements

- Flutter SDK
- Dart SDK
- GetX package

## Setup

1. Clone the repository:

```bash
git clone https://github.com/narayana-wijaya/tmdb_app.git
```

1. Navigate to the project directory:

```bash
cd your_repository
```

1. Install dependencies:

```bash
flutter pub get
```

1. This project use freezed code-generator so run this:

```bash
dart run build_runner build
```

## Project Structure

```
lib/
|-- data/
|   |-- data_sources/
|   |-- repositories/
|-- presentation/
|   |-- controllers/
|   |-- screens/
|-- domain/
|   |-- entities/
|-- main.dart

```

- **lib/data**: Contains data layer components such as data sources and repositories.
- **dlib/presentation**: Houses presentation layer components including controllers and views.
- **lib/domain**: Defines domain entities.
- **main.dart**: Entry point of the application.

## Usage

This project serves as a template for building Flutter applications using the repository pattern and GetX library. You can extend and modify it to suit your specific requirements.

## License

This project is licensed under the MIT License - see the [LICENSE](https://www.notion.so/narayanawijaya/LICENSE) file for details.

## Acknowledgements

- [GetX](https://pub.dev/packages/get) - State management, navigation, and dependency injection library for Flutter.
- [Flutter](https://flutter.dev/) - Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.