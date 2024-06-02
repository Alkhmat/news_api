import 'package:news_api/model.dart';

sealed class ApiState {}

class InitApiState extends ApiState {}

class ErrorApiState extends ApiState {
  final String error;
  ErrorApiState(this.error);
}

class LoadingApiState extends ApiState {}

class ResponseApiState extends ApiState {
  final List<ApiModel> api;
  ResponseApiState(this.api);
}
