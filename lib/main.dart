import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Changing Text instead of Color',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Changing Text instead of Color'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder<Text>(
          stream: _bloc.outputStateStream,
          initialData: Text('Red'),
          builder: (context, snapshot) {
            return Container(
              height: 100,
              width: 100,
              child: snapshot.data,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.event_red);
              }),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.event_green);
              }),
        ],
      ),
    );
  }
}
