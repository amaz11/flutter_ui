import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/APage.dart';
import 'package:flutter_ui/pages/NewPage.dart';
import 'package:flutter_ui/pages/TwitterForm.dart';

void main() => runApp(const MyAPP());

class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      routes: {
        '/': (context) => const MyHome(),
        '/apage': (context) => const APage(),
        '/newPage': (context) => const NewPage(),
      },
      // global theme settings
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
// body: const MyStateFulWidget(),

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.green[400],
          title: const Center(
        child: Text(
          'Home',
          style: TextStyle(
            fontSize: 18.5,
            color: Colors.white,
          ),
        ),
      )),
      body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: const TwitterForm()),
    );
  }
}

class ResponsiveDesign extends StatefulWidget {
  const ResponsiveDesign({super.key});

  @override
  State<ResponsiveDesign> createState() => _ResponsiveDesignState();
}

class _ResponsiveDesignState extends State<ResponsiveDesign> {
  Widget _bigDisplay() {
    return const Row();
  }

  Widget _smallDisplay() {
    return const Column();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Container(
      child: width > 500 ? _bigDisplay() : _smallDisplay(),
    );
  }
}
