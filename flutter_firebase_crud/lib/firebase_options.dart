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
    apiKey: 'AIzaSyArUFeRTbu07-J9JIz6_EaABi2oWCVURok',
    appId: '1:500282370381:web:14b4cfc70f900e5661ef04',
    messagingSenderId: '500282370381',
    projectId: 'fir-crud-a592c',
    authDomain: 'fir-crud-a592c.firebaseapp.com',
    storageBucket: 'fir-crud-a592c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQJnqOPajrK9qvXgHUBKN7gL2Q_zqZUaU',
    appId: '1:500282370381:android:c353f9f02e32c0bc61ef04',
    messagingSenderId: '500282370381',
    projectId: 'fir-crud-a592c',
    storageBucket: 'fir-crud-a592c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9LQzXBjfD3JVXcz1t_uzya-glTv3NVds',
    appId: '1:500282370381:ios:163cf64bbfccbb4261ef04',
    messagingSenderId: '500282370381',
    projectId: 'fir-crud-a592c',
    storageBucket: 'fir-crud-a592c.appspot.com',
    iosBundleId: 'kavindu.flutterFirebaseCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9LQzXBjfD3JVXcz1t_uzya-glTv3NVds',
    appId: '1:500282370381:ios:25dc6ae94c52c01761ef04',
    messagingSenderId: '500282370381',
    projectId: 'fir-crud-a592c',
    storageBucket: 'fir-crud-a592c.appspot.com',
    iosBundleId: 'kavindu.flutterFirebaseCrud.RunnerTests',
  );
}
