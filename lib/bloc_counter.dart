import 'dart:async';
import 'package:flutter_demo_bloc/counter_provider.dart';

class CounterBloc{
  final counterController = StreamController();

  Stream get getCount => counterController.stream;

  final CounterProvider provider = CounterProvider();

  void updateCount() {
    if (provider.count == 10 ){
      provider.resetCount();
    } else{
      provider.increaseCount();
    }
    counterController.sink.add(provider.count); // add whatever data we want into the Sink
  }


  void dispose() {
    counterController.close(); // close our StreamController to avoid memory leak
  }
}
final bloc = CounterBloc();

