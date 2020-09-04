import 'package:bloc/bloc.dart';
import 'package:flutter_library/counter_event.dart';
import 'package:flutter_library/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  void onIncrement(){
    dispatch(IncrementEvent());
  }

  void onDecrement(){
    dispatch(IncrementEvent());
  }

  @override
  CounterState get initalState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(
      CounterState currentState,
      CounterEvent event,
      ) async* {
    //basic increment/decrement event function
    if (event is IncrementEvent){
      yield currentState..counter += 1;
    } else if (event is DecrementEvent){
      yield currentState..counter -= 1;
    }
  }
}