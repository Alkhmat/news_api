import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/api_repository.dart';
import 'package:news_api/cubit/api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  final ApiRepository repository;
  ApiCubit(this.repository) : super(InitApiState());

  Future<void> fetchApi() async {
    emit(LoadingApiState());
    try {
      final response = await repository.getApi();
      emit(ResponseApiState(response));
    } catch (e) {
      emit(ErrorApiState(e.toString()));
    }
  }
}
