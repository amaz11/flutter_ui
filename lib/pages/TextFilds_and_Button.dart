// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/NewPage.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Center(
            child: Text(
              'Home',
              style: TextStyle(
                fontSize: 18.5,
                color: Colors.white,
              ),
            ),
          )),
      body: Column(

          // padding: const EdgeInsets.all(10),
          children: [
            Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Norification'),
                SwitchNot(),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.green,
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  // backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(16),
                  // minimumSize: const Size.fromWidth(20)
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Save'),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Save 2'),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.green,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/apage',
                      arguments: 'Argument Apage');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  // backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(16),
                  // minimumSize: const Size.fromWidth(20)
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Apage'),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.green,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) =>
                          const NewPage(name: 'New Page Class arg.'))));
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  // backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(16),
                  // minimumSize: const Size.fromWidth(20)
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('New Page'),
              ),
            ),
            const SizedBox(height: 15),
          ]),
    );
  }
}

class SwitchNot extends StatefulWidget {
  const SwitchNot({super.key});

  @override
  State<SwitchNot> createState() => _SwitchNotState();
}

class _SwitchNotState extends State<SwitchNot> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: light,
      activeColor: Colors.green,
      onChanged: (bool value) => {
        setState(() {
          light = value;
        })
      },
    );
  }
}

class MyStateFulWidget extends StatefulWidget {
  const MyStateFulWidget({super.key});

  @override
  State<MyStateFulWidget> createState() => _MyStateFulWidgetState();
}

class _MyStateFulWidgetState extends State<MyStateFulWidget> {
  final List<String> _list = <String>[
    'my-state',
    'my-state- fluid',
    'my-state-fluid-fluid-fluid some-state'
  ];
  final List<int> colorCodes = <int>[600, 500, 100];
  Widget _buildWidget() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(
              child: Text(_list[index]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List View")),
      body: _buildWidget(),
    );
  }
}
