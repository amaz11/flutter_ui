import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/Authentication_service.dart';
import 'package:flutter_ui/pages/HomePage.dart';
// import 'package:flutter_ui/pages/SignInPage.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
// import 'package:flutter_ui/pages/APage.dart';
// import 'package:flutter_ui/pages/NewPage.dart';
import 'package:flutter_ui/pages/TwitterForm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyAPP());
}

class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          Provider<AuthenticationService>(
              create: (_) => AuthenticationService(FirebaseAuth.instance)),
          StreamProvider(
              create: (context) =>
                  context.read<AuthenticationService>().authStateChages,
              initialData: null)
        ],
        child: const AuthenticatWapper(),
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Colors.blueAccent,
            toolbarHeight: 50,
            shadowColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)))),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthenticatWapper extends StatelessWidget {
  const AuthenticatWapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const HomePage();
    } else {
      return const TwitterForm();
    }
  }
}
