# Smooth Weather<img width="250" alt="Screenshot_20260515-063031" src="https://github.com/user-attachments/assets/738be687-3d65-448f-8705-d58b41bd43a7" />


A beautifully designed, responsive weather application built with Flutter which provides real-time weather updates with a focus on a premium user experience, featuring dynamic Lottie animations, and secure API integration.

## Features

* **Real-Time Weather Data:** Fetches live temperature, wind speed and humidity.
* **Dynamic Animations:** Integrates lightweight Lottie animations that adapt to the current weather condition (e.g., thunderstorms, sunny, rainy) to bring the UI to life.
* **Premium UI/UX:** Built with the 'Poppins' font, custom gradients, and a layout that perfectly adapts to different screen sizes (from standard displays to tall aspect ratios).
* **Secure by Design:** API keys are obfuscated and kept out of version control using modern environment variable management.

## Tech Stack

* **Framework:** Flutter & Dart
* **API:** [OpenWeather API](https://openweathermap.org/) (Current Weather)
* **Animations:** [Lottie for Flutter](https://pub.dev/packages/lottie)
* **Networking:** `http` package for robust JSON parsing and API consumption
* **Security:** `envied` and `envied_generator` for safe API key storage

## Getting Started

   ```bash
   git clone https://github.com/rens-build/smooth_weather.git
   cd smooth_weather
