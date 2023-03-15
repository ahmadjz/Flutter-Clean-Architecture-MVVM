# Flutter Clean Architecture MVVM

This is a Flutter project that demonstrates the implementation of the Clean Architecture and MVVM pattern. The app retrieves drinks data from an external API and caches it with Shared Preferences for offline viewing.

## Project Architecture

The project is structured using the Clean Architecture pattern, which separates the codebase into three main layers:

- Presentation Layer (UI) - Contains the UI code and its related classes.
- Domain Layer - Contains the use cases, business logic, and entities of the app.
- Data Layer - Contains the implementation of data sources, repositories, and models.

The project also implements the MVVM pattern in the Presentation Layer, which separates the UI code from the business logic and improves testability.

Here is a diagram illustrating the project architecture:

![Clean-Architecture-Flutter-Diagram](https://user-images.githubusercontent.com/46372418/225314861-2d5e98b9-06a5-453b-8ebf-e6a349a8a23c.jpg)

## External API
The app retrieves drinks data from [TheCocktailDB API](https://www.thecocktaildb.com/api.php).

## Local Storage
The app uses Shared Preferences to cache the retrieved drinks data for offline viewing.

## Screenshots 
![Screenshot_1678885585](https://user-images.githubusercontent.com/46372418/225318296-a9aa0e49-876c-45cb-beef-93632b55d197.png)
