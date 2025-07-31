````markdown
# Weather Program 🌤️

<!-- App preview with controlled width -->
<img src="assets/screenShot/img1.jpg" alt="App Preview" width="300px" />

A lightweight, responsive weather app built with **Flutter** and the OpenWeatherMap API. Search for any city, save your favorites, and quickly view current weather details at a glance.

## Features

- **City Search:** Lookup weather by city name (unlimited searches).  
- **Current Conditions:** View temperature (°C), humidity (%), wind speed (m/s), and descriptive conditions (Clear, Clouds, Rain, etc.).  
- **Favorites:** Save your favorite cities and revisit them instantly from the **Saved** tab.  
- **Responsive UI:** Adapts seamlessly to Android, iOS, and web screens.

## Screenshots

<img src="assets/screenShot/img1.jpg" alt="Search View" width="250px" />  
*Type a city name to fetch its current weather.*

<img src="assets/screenShot/img2.jpg" alt="Weather Details" width="250px" />  
*Detailed weather view, including temperature, humidity, wind speed, and a brief description.*

<img src="assets/screenShot/img3.jpg" alt="Saved Cities" width="250px" />  
*Manage your saved cities and quickly load their weather data.*

## Installation & Setup

1. **Clone the repository**  
   ```bash
   git clone https://github.com/NanoLifeM/Weather_Program.git
   cd Weather_Program
````

2. **Install Flutter and dependencies**

   * Make sure you have Flutter SDK installed:
     [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
   * Install project dependencies:

     ```bash
     flutter pub get
     ```
3. **Configure your API key**

   * Sign up at [OpenWeatherMap](https://openweathermap.org/) and get your free API key.
   * Create a file named `.env` in the project root (or adjust according to your preferred method) with:

     ```env
     OWM_API_KEY=YOUR_OPENWEATHERMAP_API_KEY
     ```
   * Make sure to add `.env` to `.gitignore` to keep your key private.
4. **Run the app**

   * For mobile (Android/iOS):

     ```bash
     flutter run
     ```
   * For web:

     ```bash
     flutter run -d chrome
     ```
5. **Build for release**

   * Android APK:

     ```bash
     flutter build apk --release
     ```
   * iOS (requires Xcode):

     ```bash
     flutter build ios --release
     ```

## Usage

1. **Search**: Enter a city name in the search bar and tap the search icon.
2. **Save**: Tap the ★ icon on any city’s weather card to add it to your favorites.
3. **View Favorites**: Switch to the **Saved** tab and tap any saved city to reload its weather.

## API Details

* **Base URL:**

  ```
  https://api.openweathermap.org/data/2.5/weather
  ```
* **Query Parameters:**

  * `q`  – City name (e.g. `London`)
  * `appid` – Your API key (from `.env`)
  * `units=metric` – Metric units (°C)
  * `lang=en` – Response language

Example request:

```
https://api.openweathermap.org/data/2.5/weather?q=Paris&appid=YOUR_API_KEY&units=metric&lang=en
```

## Tech Stack

* **Flutter & Dart**
* **open\_weather\_api** (or http + json packages)
* **flutter\_dotenv** (for environment variables)
* **Provider** / **Riverpod** (state management – adjust if different)
* **Shared Preferences** (for saving favorites)

## Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the repository
2. Create a new branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

---

© 2025 NanoLifeM

```
```

