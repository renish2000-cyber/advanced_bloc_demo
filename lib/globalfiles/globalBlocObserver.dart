import 'package:flutter_bloc/flutter_bloc.dart';

/*
* This class is used to observe global state ,event in full app
* whenever new state emitted or new event call
* */
class GlobalBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    print(bloc.state);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {}

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print(error.toString());
  }

  /*
  * This Method is called whenever new event is added
  * first transition method called then called onChange
  * */
  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    print(transition.toString());
  }

  /*
  * This method is called when ever new state emmitted
  * */
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    print(change.currentState);
    super.onChange(bloc, change);
  }

  /*
  * This method is called when new event is add
  * First : onEvent
  * secod : onTransition
  * third : onChange
  * */

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
  }
}
