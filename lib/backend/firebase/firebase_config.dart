import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyApOz5Whhc5hzzNEP5hV5wJjH-bOgLmUj8",
            authDomain: "beyondacademydb.firebaseapp.com",
            projectId: "beyondacademydb",
            storageBucket: "beyondacademydb.firebasestorage.app",
            messagingSenderId: "315242151992",
            appId: "1:315242151992:web:a2cfcf1a58a21f351c66cd",
            measurementId: "G-P1WGV3W37M"));
  } else {
    await Firebase.initializeApp();
  }
}
