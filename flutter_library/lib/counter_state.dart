import 'dart:developer';

class CounterState{
  //not initalizing counter = 0 because will be used in factory
  int counter;

  //private constructor
  CounterState._();

  //initial = start state of the bloc
  factory CounterState.initial(){
    //call private constructor
    return CounterState._()..counter = 0;
  }
}