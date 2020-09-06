import 'dart:async';
import 'package:bloc_flower/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  //gets input (pour water in sink) which has to be outputted
  StreamSink<int> get _inCounter => _counterStateController.sink;
  //push output (streams into the drain)
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;
  //helps map out the input to get it to the stream

  CounterBloc(){
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event){
    if(event is IncrementEvent){
      _counter++;
    }
    else{
      _counter--;
      _inCounter.add(_counter);
    }
  }
  void dispose(){
    //close Controllers (avoid memory leaks)
    _counterStateController.close();
    _counterEventController.close();
  }
}