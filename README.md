# Campus Connect
Campus Connect is a Flutter-based mobile application designed as an all-in-one platform for college students. It streamlines academic collaboration, campus commerce, and transportation by offering three core features: Study Hub, Campus Marketplace, and Cab Sharing. The app uses Firebase for authentication and data storage, ensuring a secure and scalable experience.

## Features
- Study Hub: Create and join study groups, share resources, and schedule meetings with integration for platforms like Zoom or Google Meet.
- Campus Marketplace: Buy and sell used items (e.g., books, electronics) within the college community, with user ratings and direct messaging.
- Cab Sharing: Facilitate ride-sharing among students or with external drivers, with a commission-based monetization model.
- Authentication: Secure email-based login with college email verification (e.g., *.edu or @college.edu).

## Tech Stack
- Frontend: Flutter (Dart) for cross-platform mobile development (Android and iOS).
- Backend: Firebase (Authentication, Firestore for data storage).
- State Management: Flutter Bloc (Cubit) for scalable UI state handling.
- Dependency Injection: get_it for managing dependencies.
- Version Control: Git with a remote repository (e.g., GitHub).

## Project Structure
```bash
campus_connect/
├── lib/
│   ├── core/                       # Constants, reusable widgets, Firebase services
│   ├── features/                   # Feature-specific code (auth, study_hub, marketplace, cab_sharing, profile)
│   ├── app.dart                    # Main app widget
│   ├── main.dart                   # App entry point
│   └── routes.dart                 # Navigation routes
├── assets/                         # Images, fonts
├── test/                           # Unit and widget tests
├── android/                        # Android-specific configuration
├── ios/                            # iOS-specific configuration
├── pubspec.yaml                    # Dependencies and metadata
├── .gitignore                      # Files/folders to exclude from Git
└── README.md                       # Project documentation
```


## Prerequisites
- Flutter: Version 3.0.0 or higher (flutter --version to check).
- Dart: Version 2.17.0 or higher.
- Git: Installed and configured (git --version).
- Firebase Account: For authentication and Firestore setup.
- IDE: VS Code or Android Studio with Flutter plugins.
- Devices: Android emulator/device or iOS simulator/device.

## Setup Instructions
1. **Clone the Repository**
   Clone the project from the remote repository:
   ```bash
   git clone https://github.com/your-username/campus_connect.git
   cd campus_connect   ```

2. **Install Dependencies**
   Install Dependencies:+
     ```bash
     flutter pub get  ```

3. **Configure Firebase**
   1. ***Create a Firebase Project:***
     - Go to the Firebase Console.
     - Create a new project named Campus Connect.
     - Add Android apps to the project.

  2. ***Download Configuration Files***
     - For Android: Download google-services.json and place it in android/app

  3. ***Update Build Files***
     - Android
         - Add to android/build.gradle:
         ```bash
         classpath 'com.google.gms:google-services:4.3.15'
         ```

         - Add to android/app/build.gradle:
         ```bash
         apply plugin: 'com.google.gms.google-services'
         ```
  4. **Set Up Firestore:**
  - Enable Firestore in the Firebase Console (choose a region close to your users, e.g., asia-south1).
  - Add security rules to firestore.rules
  
  ```bash
     rules_version = '2';
  service cloud.firestore {
    match /databases/{database}/documents {
      match /users/{userId} {
        allow read: if request.auth != null && request.auth.token.email.matches('.*@college\\.edu$');
        allow write: if request.auth != null && request.auth.uid == userId;
      }
      match /study_groups/{groupId} {
        allow read: if request.auth != null && request.auth.token.email.matches('.*@college\\.edu$');
        allow write: if request.auth != null && request.auth.token.email.matches('.*@college\\.edu$');
      }
      match /listings/{listingId} {
        allow read: if request.auth != null && request.auth.token.email.matches('.*@college\\.edu$');
        allow write: if request.auth != null && request.auth.token.email.matches('.*@college\\.edu$');
      }
      match /rides/{rideId} {
        allow read: if request.auth != null && request.auth.token.email.matches('.*@college\\.edu$');
        allow write: if request.auth != null && request.auth.token.email.matches('.*@college\\.edu$');
      }
    }
  }
  ```
  
  5. **Enable Authentication**
  - In the Firebase Console, enable Email/Password authentication.


4. **Run the App**
1. - Start an emulator/simulator or connect a physical device.
   - Run the app:
   ```bash
      flutter run
   ```
   - Sign up or log in with a college email (e.g., student@college.edu).

5. **Build for Release**
   - To build APKs or IPA files for distribution:
       - android 
   ```bash
      flutter build apk --release
   ```

   - Output: build/app/outputs/flutter-apk/app-release.apk
6. **Testing**
   - Run unit and widget tests:

   ```bash
    flutter test
     ```
**Contact**
  - For issues or suggestions, open an issue on the GitHub repository or contact the 
    maintainer at aarshsthakur@gmail.com.
    
     
