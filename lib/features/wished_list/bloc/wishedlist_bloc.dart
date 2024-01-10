import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wishedlist_event.dart';
part 'wishedlist_state.dart';

class WishedlistBloc extends Bloc<WishedlistEvent, WishedlistState> {
  WishedlistBloc() : super(WishedlistInitial()) {
    on<WishedlistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
