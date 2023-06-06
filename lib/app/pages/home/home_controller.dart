import 'package:bloc/bloc.dart';
import 'package:vakinha_burger/app/pages/home/home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(const HomeState.initial());
}
