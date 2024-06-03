import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB7ZpzWWJcKKYL291Yp_COj5cVq298l9cc",
            authDomain: "red-essence-lepyfn.firebaseapp.com",
            projectId: "red-essence-lepyfn",
            storageBucket: "red-essence-lepyfn.appspot.com",
            messagingSenderId: "667863575928",
            appId: "1:667863575928:web:5dab1c65e9ef148e7f2c8d"));
  } else {
    await Firebase.initializeApp();
  }
}
