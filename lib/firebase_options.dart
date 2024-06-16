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
    apiKey: 'AIzaSyBmKZN4L8ZRpAuYCna51hrzaxQYflv2FMI',
    appId: '1:201876533924:web:cbacad6d45fee8e1e56c31',
    messagingSenderId: '201876533924',
    projectId: 'zylu-project',
    authDomain: 'zylu-project.firebaseapp.com',
    storageBucket: 'zylu-project.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_j1KTISvTq_90geFUeYdVZ2v4q6QJS3Y',
    appId: '1:201876533924:android:e28c2e6f9bc61d4fe56c31',
    messagingSenderId: '201876533924',
    projectId: 'zylu-project',
    storageBucket: 'zylu-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtVwvxJmPwmd-85s-ibW_gtBq_dUEowHk',
    appId: '1:201876533924:ios:def328d94d9b99a3e56c31',
    messagingSenderId: '201876533924',
    projectId: 'zylu-project',
    storageBucket: 'zylu-project.appspot.com',
    iosBundleId: 'com.example.zyluAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtVwvxJmPwmd-85s-ibW_gtBq_dUEowHk',
    appId: '1:201876533924:ios:def328d94d9b99a3e56c31',
    messagingSenderId: '201876533924',
    projectId: 'zylu-project',
    storageBucket: 'zylu-project.appspot.com',
    iosBundleId: 'com.example.zyluAssignment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBmKZN4L8ZRpAuYCna51hrzaxQYflv2FMI',
    appId: '1:201876533924:web:c80e7c5b165edafce56c31',
    messagingSenderId: '201876533924',
    projectId: 'zylu-project',
    authDomain: 'zylu-project.firebaseapp.com',
    storageBucket: 'zylu-project.appspot.com',
  );
}
