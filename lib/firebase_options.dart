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
    apiKey: 'AIzaSyC_o0ExfzKVjO8Rdx_GeAsAS1VdBxYyWEk',
    appId: '1:515499451318:web:0ef4e2d852f5910e749717',
    messagingSenderId: '515499451318',
    projectId: 'notes-450b1',
    authDomain: 'notes-450b1.firebaseapp.com',
    storageBucket: 'notes-450b1.appspot.com',
    measurementId: 'G-G4GPZQP7PW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmpwi3qL1CkNd_G_0oQucW0V23S_Yj12U',
    appId: '1:515499451318:android:6dfcc8c2abfb05b2749717',
    messagingSenderId: '515499451318',
    projectId: 'notes-450b1',
    storageBucket: 'notes-450b1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5gdy-G043PyyIejNJroOpMDuUprVa_qc',
    appId: '1:515499451318:ios:7796a7082cb1a40f749717',
    messagingSenderId: '515499451318',
    projectId: 'notes-450b1',
    storageBucket: 'notes-450b1.appspot.com',
    iosBundleId: 'com.example.notes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5gdy-G043PyyIejNJroOpMDuUprVa_qc',
    appId: '1:515499451318:ios:7796a7082cb1a40f749717',
    messagingSenderId: '515499451318',
    projectId: 'notes-450b1',
    storageBucket: 'notes-450b1.appspot.com',
    iosBundleId: 'com.example.notes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC_o0ExfzKVjO8Rdx_GeAsAS1VdBxYyWEk',
    appId: '1:515499451318:web:1772b7253fbcb751749717',
    messagingSenderId: '515499451318',
    projectId: 'notes-450b1',
    authDomain: 'notes-450b1.firebaseapp.com',
    storageBucket: 'notes-450b1.appspot.com',
    measurementId: 'G-CKF9JSPJXZ',
  );

}