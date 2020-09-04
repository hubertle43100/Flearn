import 'dart:developer';

abstract class CounterEvent{
}

class IncrementEvent extends CounterEvent{}
class DecrementEvent extends CounterEvent{}