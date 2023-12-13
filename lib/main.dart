import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/Authentication_service.dart';
import 'package:flutter_ui/pages/HomePage.dart';
import 'package:flutter_ui/pages/SignInPage.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_ui/pages/APage.dart';
// import 'package:flutter_ui/pages/NewPage.dart';
// import 'package:flutter_ui/pages/TwitterForm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyAPP());
}

class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChages,
            initialData: null)
      ],
      child: MaterialApp(
        // If routes are declared then home key is no longer required.

        // home: Scaffold(
        //   appBar: AppBar(
        //       backgroundColor: Colors.green[400],
        //       title: const Center(
        //         child: Text(
        //           'Home',
        //           style: TextStyle(
        //             fontSize: 18.5,
        //             color: Colors.white,
        //           ),
        //         ),
        //       )),
        //   body: Column(
        //       // padding: const EdgeInsets.all(10),
        //       children: [
        //         Image.network(
        //           'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
        //           height: 150,
        //           width: 150,
        //         ),
        //         const SizedBox(height: 15),
        //         Container(
        //           padding: const EdgeInsets.only(left: 10, right: 10),
        //           child: const TextField(
        //             obscureText: false,
        //             decoration: InputDecoration(
        //               border: OutlineInputBorder(),
        //               labelText: 'User Name',
        //             ),
        //           ),
        //         ),
        //         const SizedBox(height: 15),
        //         const Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text('Norification'),
        //             SwitchNot(),
        //           ],
        //         ),
        //         const SizedBox(height: 15),
        //         Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(5),
        //             color: Colors.green,
        //           ),
        //           child: TextButton(
        //             onPressed: () {},
        //             style: TextButton.styleFrom(
        //               foregroundColor: Colors.white,
        //               // backgroundColor: Colors.green,
        //               padding: const EdgeInsets.all(16),
        //               // minimumSize: const Size.fromWidth(20)
        //               textStyle: const TextStyle(fontSize: 20),
        //             ),
        //             child: const Text('Save'),
        //           ),
        //         ),
        //         ElevatedButton(
        //           onPressed: () {},
        //           child: const Text('Save 2'),
        //         )
        //       ]),
        // ),

        // routes: {
        //   '/': (context)=> Page Class Name
        // },
        // routes: {
        //   '/': (context) => const MyHome(),
        //   '/apage': (context) => const APage(),
        //   '/newPage': (context) => const NewPage(),
        // },
        // global theme settings
        home: const AuthenticatWapper(),
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
      ),
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
      return const SignInPage();
    }
  }
}
