// main.dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RefreshIndicator Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FeedPage(),
    );
  }
}

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<String> _items = List.generate(10, (index) => 'Noticia ${index + 1}');
  bool _isRefreshing = false;

  Future<void> _onRefresh() async {
    // Simula una llamada a API o carga de datos
    await Future.delayed(const Duration(seconds: 2));
    
    setState(() {
      _items = List.generate(10, (index) => 'Noticia ${index + 1} (actualizada ${DateTime.now().hour}:${DateTime.now().minute})');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feed actualizable')),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.article),
              title: Text(_items[index]),
              subtitle: Text('Tira hacia abajo para refrescar'),
            );
          },
        ),
      ),
    );
  }
}