# Flight Booking App ✈️

A premium, production-level Flutter application for flight booking, built with a focus on modern aesthetics, resilient networking, and a clean, feature-first architecture.

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest version recommended)
- Android Studio / VS Code
- An active internet connection (initial run)

### Installation & Run Steps
1. **Clone the repository**:
   ```bash
   git clone https://github.com/AmulRamteke/flight_booking_app/
   cd flight_booking_app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run code generation**:
   The project uses `freezed` and `riverpod_generator`. Run this to generate the necessary files:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Launch the application**:
   ```bash
   flutter run
   ```

## 🛠️ Dependencies Used

### Core
*   **flutter_riverpod**: For reactive and testable state management.
*   **dio**: Powerful HTTP client for API interactions.
*   **go_router**: Declarative routing for seamless navigation.

### Resilience & Storage
*   **dio_smart_retry**: Automatic retry logic with exponential backoff.
*   **dio_cache_interceptor**: Advanced caching mechanism.
*   **hive_flutter**: Lightweight NoSQL database used for cache persistence.
*   **connectivity_plus**: Real-time network status monitoring.

### UI & UX
*   **google_fonts**: Premium typography (Inter & Outfit).
*   **shimmer**: Elegant skeleton loading states.
*   **flutter_svg**: Vector graphics support.
*   **flutter_spinkit**: Modern loading indicators.
*   **barcode_widget** & **mobile_scanner**: For ticket generation and scanning.

### Development Tools
*   **freezed**: Type-safe data modeling.
*   **json_serializable**: Automated JSON parsing.
*   **riverpod_generator**: Code generation for providers.

## 🧠 My Approach & Thought Process

### 1. Architectural Strategy
I moved away from a strictly over-engineered "Clean Architecture" toward a **Feature-First Architecture**. This approach balances separation of concerns with developer productivity. Each feature (Search, Details) contains its own models, providers, and UI, making the codebase highly modular and easy to scale.

### 2. Networking Resilience
Recognizing that travel apps are often used on-the-go with spotty connections, I prioritized **Resilience**:
- **Offline First**: Implemented Hive-based caching so users can view previously searched flights and their boarding passes without an active connection.
- **Fail-Safe Requests**: Integrated retry logic to handle transient failures automatically.

### 3. State Management Philosophy
Used **Riverpod** not just for global state, but for dependency injection and asynchronous data handling. This ensures that the UI stays in sync with the data source and makes error handling consistent across the app.

### 4. Premium Aesthetic
To achieve a "WOW" factor:
- **Design System**: Created a centralized theme using Deep Indigo and Sky Blue.
- **Custom Components**: Developed a custom ticket widget with realistic perforations and micro-animations.
- **Responsiveness**: Ensured the layout adapts fluidly across different screen sizes using flexible layouts and constrained containers.

---

## 📁 Project Structure
```text
lib/
├── core/               # Shared logic, constants, and global widgets
│   ├── network/        # DioClient, Retry logic, Caching
│   ├── theme/          # Premium design system
│   └── widgets/        # Reusable UI components
└── features/           # Feature-based organization
    ├── search/         # Flight searching, filtering, and results
    └── details/        # Boarding pass, passenger info, and scanner
```
