import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter somma texfield',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Somma Text Field'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //controller per prendere i dati dai text field
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  int _counter = 0;

  @override
  void dispose() {
    // Svuota il controller per non avere piu' istanze
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Somma di due numeri:',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                //collego il controller al textfield
                controller: myController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Numero 1',
                    suffixIcon: Icon(Icons.numbers)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: myController2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numero 2',
                  suffixIcon: Icon(Icons.numbers),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    //aggiorno il valore della variabile _counter
                    _counter = int.parse(myController.text) +
                        int.parse(myController2.text);
                  });
                },
                child: const Text("Somma")),
            Text("La somma dei numeri è: $_counter"),
          ],
        ),
      ),
    );
  }
}
