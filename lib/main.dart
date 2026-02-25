void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conectai',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Conectai'),
        ),
        body: Center(
          child: Text('Hello, Conectai!'),
        ),
      ),
    );
  }
}