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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCSew0GntCRJnnM3q5XcMEO-9yH1hVYesw',
    appId: '1:570617674935:web:f26156c29e121b2e08a132',
    messagingSenderId: '570617674935',
    projectId: 'travelin-app-29012',
    authDomain: 'travelin-app-29012.firebaseapp.com',
    storageBucket: 'travelin-app-29012.firebasestorage.app',
    measurementId: 'G-TVGNGK29WX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_5Dg47xYdPWvz51BwU_xHlT-PQTDDkaY',
    appId: '1:570617674935:android:60749566e0f4fcdf08a132',
    messagingSenderId: '570617674935',
    projectId: 'travelin-app-29012',
    storageBucket: 'travelin-app-29012.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD38R0mwGE2dRmrOBtDuW4TpikVQIrd-PE',
    appId: '1:570617674935:ios:5506725603b50f2908a132',
    messagingSenderId: '570617674935',
    projectId: 'travelin-app-29012',
    storageBucket: 'travelin-app-29012.firebasestorage.app',
    iosBundleId: 'com.example.travelin',
  );
}
