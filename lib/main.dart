import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Accumulator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Accumulator")),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final TextEditingController _controller = TextEditingController();
  double accumulationResult = 0;

  void updateAccumulation(newValue) {
    accumulationResult = newValue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Result: $accumulationResult",
              style: const TextStyle(
                fontSize: 32.0,
                color: Colors.black87,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "type...",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.blueAccent)),
              ),
              controller: _controller,
              onChanged: getAccumulation,
            ),
          ),
        ],
      ),
    );
  }

  void getAccumulation(String content) async {
    List<String> values = content.split(RegExp(" |,"));
    double result = 0;
    for (String value in values) {
      double? numericValue = double.tryParse(value);
      if (numericValue != null) result += numericValue;
    }
    updateAccumulation(result);
    debugPrint(result.toString());
  }
}
