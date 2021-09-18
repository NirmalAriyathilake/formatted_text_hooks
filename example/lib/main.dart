import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formatted_text_hooks/formatted_text_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formatted Text Hook Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textEditingController = useFormattedTextController();
    final _textValue = useState('');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formatted Text Hook Demo'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: FormattedText(
                _textValue.value,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: TextField(
                controller: _textEditingController,
                onChanged: (value) {
                  _textValue.value = value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
