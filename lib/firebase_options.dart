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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'SUA_API_KEY_WEB',
    appId: 'SEU_APP_ID_WEB',
    messagingSenderId: 'SEU_SENDER_ID',
    projectId: 'checkfast-9ce1f',
    authDomain: 'checkfast-9ce1f.firebaseapp.com',
    storageBucket: 'checkfast-9ce1f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'SUA_API_KEY_ANDROID',
    appId: 'SEU_APP_ID_ANDROID',
    messagingSenderId: 'SEU_SENDER_ID',
    projectId: 'checkfast-9ce1f',
    storageBucket: 'checkfast-9ce1f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'SUA_API_KEY_IOS',
    appId: 'SEU_APP_ID_IOS',
    messagingSenderId: 'SEU_SENDER_ID',
    projectId: 'checkfast-9ce1f',
    storageBucket: 'checkfast-9ce1f.appspot.com',
    iosBundleId: 'com.seunome.checkfast',
  );
}
