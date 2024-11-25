<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Women SOS App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
            background-color: #f9f9f9;
            color: #333;
        }
        h1 {
            color: #e63946;
            text-align: center;
        }
        h2 {
            color: #457b9d;
            border-bottom: 2px solid #a8dadc;
            padding-bottom: 5px;
        }
        ul {
            margin: 10px 0;
            padding-left: 20px;
        }
        code {
            background: #f1faee;
            padding: 2px 4px;
            border-radius: 4px;
        }
        pre {
            background: #f1faee;
            padding: 10px;
            border-radius: 5px;
            overflow-x: auto;
        }
        a {
            color: #1d3557;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .screenshots img {
            width: 100%;
            max-width: 600px;
            margin: 10px 0;
            display: block;
        }
    </style>
</head>
<body>
    <h1>Women SOS App 🚨</h1>

    <p>A <strong>Women Safety Application</strong> developed using Flutter, designed to ensure safety and provide quick access to help during emergencies. The app features a secure login system powered by Firebase Authentication and Firestore for managing user roles. This app empowers women by offering real-time safety solutions and instant alerts.</p>

    <h2>Features 🌟</h2>
    <ul>
        <li><strong>User Authentication</strong>: Secure login and registration using Firebase Authentication.</li>
        <li><strong>User Role Management</strong>: Store and manage user roles with Firestore.</li>
        <li><strong>Emergency SOS Alert</strong>: Send an SOS message to preconfigured contacts with location details.</li>
        <li><strong>Real-Time Location Tracking</strong>: Share live location with trusted contacts.</li>
        <li><strong>Quick Access</strong>: Single-tap buttons for immediate action during emergencies.</li>
        <li><strong>Helpline Numbers</strong>: Access to national and local emergency numbers.</li>
    </ul>

    <h2>Screenshots 📱</h2>
    <div class="screenshots">
        <!-- Replace with actual screenshot paths -->
        <img src="screenshot1.png" alt="Screenshot 1">
        <img src="screenshot2.png" alt="Screenshot 2">
    </div>

    <h2>Installation 🔧</h2>
    <p>Follow the steps below to set up and run the app locally:</p>
    <pre><code>git clone https://github.com/your-username/women-sos-app.git
cd women-sos-app
flutter pub get</code></pre>
    <p>Configure Firebase:</p>
    <ul>
        <li>Create a Firebase project and add an Android/iOS app.</li>
        <li>Download the <code>google-services.json</code> (for Android) or <code>GoogleService-Info.plist</code> (for iOS) file and place them in their respective folders:
            <ul>
                <li><code>android/app/</code></li>
                <li><code>ios/Runner/</code></li>
            </ul>
        </li>
    </ul>
    <p>Run the app:</p>
    <pre><code>flutter run</code></pre>

    <h2>Tech Stack 💻</h2>
    <ul>
        <li><strong>Frontend</strong>: Flutter (Dart)</li>
        <li><strong>Backend</strong>: Firebase (Authentication, Firestore, and Cloud Functions)</li>
        <li><strong>APIs</strong>: Google Maps API (for location sharing)</li>
    </ul>

    <h2>Folder Structure 📂</h2>
    <pre><code>women-sos-app/
├── lib/
│   ├── models/       # Data models
│   ├── screens/      # UI screens
│   ├── services/     # Firebase and location services
│   ├── widgets/      # Reusable UI components
│   ├── main.dart     # App entry point
├── android/          # Android-specific files
├── ios/              # iOS-specific files
├── pubspec.yaml      # App dependencies
└── README.md         # Project documentation</code></pre>

    <h2>Contribution 🤝</h2>
    <p>We welcome contributions to make the Women SOS App better!</p>
    <ol>
        <li>Fork the repository.</li>
        <li>Create a new branch: <code>git checkout -b feature/your-feature-name</code></li>
        <li>Commit your changes: <code>git commit -m "Add your feature description"</code></li>
        <li>Push to the branch: <code>git push origin feature/your-feature-name</code></li>
        <li>Open a pull request.</li>
    </ol>

    <h2>License 📜</h2>
    <p>This project is licensed under the <a href="LICENSE">MIT License</a>.</p>

    <h2>Contact 📧</h2>
    <p><strong>Developer</strong>: Shivansh Mahajan</p>
    <p><strong>Email</strong>: <a href="mailto:your-email@example.com">your-email@example.com</a></p>
    <p><strong>GitHub</strong>: <a href="https://github.com/your-username" target="_blank">github.com/your-username</a></p>

    <h2>Acknowledgments 🙌</h2>
    <p>Thanks to everyone who contributed to this project and the open-source community for their amazing resources.</p>
</body>
</html>
