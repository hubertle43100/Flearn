import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';
import 'counter_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<CounterBloc>(context),
        builder: (context, CounterState state){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have pushed the button this many times:'),
                Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.display1,
                )
              ],
            ),
          );
        },),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc>(context).onIncrement(),
            tooltip: 'Increment',
            child: Icon(Icon.add),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc>(context).onDecrement(),
            tooltip: 'Decrement',
            child: Icon(Icon.remove),
          ),
        ],
      )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose(){
    _counterBloc.dispose();
    super.dispose();
  }
}
