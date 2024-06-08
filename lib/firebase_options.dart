// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBQegGPRTRPcrq_7HvPL8VNGbwv10KzVA8',
    appId: '1:692673595966:web:ed1f285af76279fd119f6f',
    messagingSenderId: '692673595966',
    projectId: 'shoesly-2a642',
    authDomain: 'shoesly-2a642.firebaseapp.com',
    storageBucket: 'shoesly-2a642.appspot.com',
    measurementId: 'G-TJ952B83DV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNhLnM2t4rjaqJRGcUzJimx14WnKIxZCA',
    appId: '1:692673595966:android:076e27d60e8abe4f119f6f',
    messagingSenderId: '692673595966',
    projectId: 'shoesly-2a642',
    storageBucket: 'shoesly-2a642.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUF27_qD-SguUBxyUXJAIBya8e8vrMyac',
    appId: '1:692673595966:ios:7d157078d16d19a3119f6f',
    messagingSenderId: '692673595966',
    projectId: 'shoesly-2a642',
    storageBucket: 'shoesly-2a642.appspot.com',
    iosBundleId: 'com.example.shoesly',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUF27_qD-SguUBxyUXJAIBya8e8vrMyac',
    appId: '1:692673595966:ios:7d157078d16d19a3119f6f',
    messagingSenderId: '692673595966',
    projectId: 'shoesly-2a642',
    storageBucket: 'shoesly-2a642.appspot.com',
    iosBundleId: 'com.example.shoesly',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBQegGPRTRPcrq_7HvPL8VNGbwv10KzVA8',
    appId: '1:692673595966:web:e3f0428b9b71d16e119f6f',
    messagingSenderId: '692673595966',
    projectId: 'shoesly-2a642',
    authDomain: 'shoesly-2a642.firebaseapp.com',
    storageBucket: 'shoesly-2a642.appspot.com',
    measurementId: 'G-00NKCWR82E',
  );
}