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
    apiKey: 'AIzaSyDjzlMT88qnIv1WfSyO3pqvZIU0Ihp5NcA',
    appId: '1:1035204389827:web:7c5f3aa9e34802003deb76',
    messagingSenderId: '1035204389827',
    projectId: 'flard-4fb78',
    authDomain: 'flard-4fb78.firebaseapp.com',
    storageBucket: 'flard-4fb78.firebasestorage.app',
    measurementId: 'G-X8W1YQT48F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3yhxzYVJbER8Wb1KiHO_QqhMUbQqJxyU',
    appId: '1:1035204389827:android:bc9c57a360b266de3deb76',
    messagingSenderId: '1035204389827',
    projectId: 'flard-4fb78',
    storageBucket: 'flard-4fb78.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcynLIABO9ZleFwevQ3Rqb8KEeLq9l_c0',
    appId: '1:1035204389827:ios:041e2f909c911bd93deb76',
    messagingSenderId: '1035204389827',
    projectId: 'flard-4fb78',
    storageBucket: 'flard-4fb78.firebasestorage.app',
    iosBundleId: 'com.example.itec',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcynLIABO9ZleFwevQ3Rqb8KEeLq9l_c0',
    appId: '1:1035204389827:ios:041e2f909c911bd93deb76',
    messagingSenderId: '1035204389827',
    projectId: 'flard-4fb78',
    storageBucket: 'flard-4fb78.firebasestorage.app',
    iosBundleId: 'com.example.itec',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDjzlMT88qnIv1WfSyO3pqvZIU0Ihp5NcA',
    appId: '1:1035204389827:web:15ffe4dc8a09a70a3deb76',
    messagingSenderId: '1035204389827',
    projectId: 'flard-4fb78',
    authDomain: 'flard-4fb78.firebaseapp.com',
    storageBucket: 'flard-4fb78.firebasestorage.app',
    measurementId: 'G-98K7QWZLK6',
  );

}