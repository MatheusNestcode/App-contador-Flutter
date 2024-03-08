import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  void decrement() {
    setState(() {
        counter--;
    });
  }

  void increment() {
    setState(() {
        counter++;
    });
  }

  bool get isEmpty => counter == 0;
  bool get isFull => counter == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/fundo.jpeg'),
            fit: BoxFit.cover,
          )
        ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            isFull ? 'Lotado!' :'Pode entrar!',
            style:  TextStyle(
              fontSize: 30,
              color: isFull ? Colors.red : Colors.white, // Change to the desired text color
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
            '$counter',
            style: TextStyle(
              fontSize: 100,
              color: isFull ? Colors.red : Colors.white, // Change to the desired text color
              fontWeight: FontWeight.bold,
            ),
          ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: isEmpty ? null : decrement,
                 style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                   borderRadius:  BorderRadius.circular(24),
                  ),
                  backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                  fixedSize: const Size(100, 100),
                  
                ),
                child: const Text(
                  'Saiu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox (width: 32),
              TextButton(
                onPressed: isFull ? null : increment,
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                   borderRadius:  BorderRadius.circular(24),
                  ),
                   backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                  fixedSize: const Size(100, 100),
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
