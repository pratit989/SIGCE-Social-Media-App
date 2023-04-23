import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAOhXl8DyH03sKMRqXZIfChkZEsydxx7bk",
            authDomain: "sigce-4fb49.firebaseapp.com",
            projectId: "sigce-4fb49",
            storageBucket: "sigce-4fb49.appspot.com",
            messagingSenderId: "229171200533",
            appId: "1:229171200533:web:d98d34f0cd74701f14441c",
            measurementId: "G-QPL9QXGR0S"));
  } else {
    await Firebase.initializeApp();
  }
}
