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
    apiKey: 'AIzaSyA1YE_cHdXokAkL24GASoUNkhBj1_LZi7k',
    appId: '1:227952045027:web:e27037e50cd31c5ddd0ed6',
    messagingSenderId: '227952045027',
    projectId: 'fireeebasee-4e118',
    authDomain: 'fireeebasee-4e118.firebaseapp.com',
    storageBucket: 'fireeebasee-4e118.firebasestorage.app',
    measurementId: 'G-5YV1D0PYYQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDExTZOPchelh5Tz_zOoXLBZTsADGpzmEw',
    appId: '1:227952045027:android:9aacaa71bf6a58fadd0ed6',
    messagingSenderId: '227952045027',
    projectId: 'fireeebasee-4e118',
    storageBucket: 'fireeebasee-4e118.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4Azbot0mDB_8Z--UuKNfwgPcKI2Raxz8',
    appId: '1:227952045027:ios:df9b4513e10acfa7dd0ed6',
    messagingSenderId: '227952045027',
    projectId: 'fireeebasee-4e118',
    storageBucket: 'fireeebasee-4e118.firebasestorage.app',
    iosClientId: '227952045027-c4pvtu31obpa0lc0sg169suttrrv38ic.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebasseeee',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4Azbot0mDB_8Z--UuKNfwgPcKI2Raxz8',
    appId: '1:227952045027:ios:df9b4513e10acfa7dd0ed6',
    messagingSenderId: '227952045027',
    projectId: 'fireeebasee-4e118',
    storageBucket: 'fireeebasee-4e118.firebasestorage.app',
    iosClientId: '227952045027-c4pvtu31obpa0lc0sg169suttrrv38ic.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebasseeee',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA1YE_cHdXokAkL24GASoUNkhBj1_LZi7k',
    appId: '1:227952045027:web:10422cd10c9a1de4dd0ed6',
    messagingSenderId: '227952045027',
    projectId: 'fireeebasee-4e118',
    authDomain: 'fireeebasee-4e118.firebaseapp.com',
    storageBucket: 'fireeebasee-4e118.firebasestorage.app',
    measurementId: 'G-KQPNGM0NXE',
  );
}
