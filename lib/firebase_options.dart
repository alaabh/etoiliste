// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDWQvmX_a6qWPeAG7DsY2_VBt-_0M41cr8',
    appId: '1:484198241952:web:82978f21c21433dbae5bc5',
    messagingSenderId: '484198241952',
    projectId: 'etoiliste-54c92',
    authDomain: 'etoiliste-54c92.firebaseapp.com',
    storageBucket: 'etoiliste-54c92.appspot.com',
    measurementId: 'G-1KS1WPT3XP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDj4o4JENrYKdgEhDlhqCf33FVdyeZ2t7o',
    appId: '1:484198241952:android:1d23ed09b5f71cfbae5bc5',
    messagingSenderId: '484198241952',
    projectId: 'etoiliste-54c92',
    storageBucket: 'etoiliste-54c92.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0CvmBcXmDneDCubf7UkokYfbHzYk7Rco',
    appId: '1:484198241952:ios:d8d536acb488575cae5bc5',
    messagingSenderId: '484198241952',
    projectId: 'etoiliste-54c92',
    storageBucket: 'etoiliste-54c92.appspot.com',
    iosBundleId: 'com.example.etoilisteBouhjar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0CvmBcXmDneDCubf7UkokYfbHzYk7Rco',
    appId: '1:484198241952:ios:a8f5d1c90587d798ae5bc5',
    messagingSenderId: '484198241952',
    projectId: 'etoiliste-54c92',
    storageBucket: 'etoiliste-54c92.appspot.com',
    iosBundleId: 'com.example.etoilisteBouhjar.RunnerTests',
  );
}