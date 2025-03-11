import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDZNOhZUzCn_BPgY-KPaCbG09u6QvILL2Y',
    appId: '1:801963844458:web:790e9523ec06d8cc203b13',
    messagingSenderId: '801963844458',
    projectId: 'flardsfinal',
    authDomain: 'flardsfinal.firebaseapp.com',
    storageBucket: 'flardsfinal.firebasestorage.app',
    measurementId: 'G-YSQ0NKL9MC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-nKPXejV9wV8CTpL8sj9xRQWITkeVbkA',
    appId: '1:801963844458:android:07c9cd7fa49d930c203b13',
    messagingSenderId: '801963844458',
    projectId: 'flardsfinal',
    storageBucket: 'flardsfinal.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBv6yPHTgG4-dOdpjKyxVYhFA1DltuOzKs',
    appId: '1:801963844458:ios:d2c7cfc852147f8a203b13',
    messagingSenderId: '801963844458',
    projectId: 'flardsfinal',
    storageBucket: 'flardsfinal.firebasestorage.app',
    iosBundleId: 'com.example.flardsfinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBv6yPHTgG4-dOdpjKyxVYhFA1DltuOzKs',
    appId: '1:801963844458:ios:d2c7cfc852147f8a203b13',
    messagingSenderId: '801963844458',
    projectId: 'flardsfinal',
    storageBucket: 'flardsfinal.firebasestorage.app',
    iosBundleId: 'com.example.flardsfinal',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDZNOhZUzCn_BPgY-KPaCbG09u6QvILL2Y',
    appId: '1:801963844458:web:c5f5f8b8e91aaa8d203b13',
    messagingSenderId: '801963844458',
    projectId: 'flardsfinal',
    authDomain: 'flardsfinal.firebaseapp.com',
    storageBucket: 'flardsfinal.firebasestorage.app',
    measurementId: 'G-NLNN6ZSLS7',
  );

}