import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/api_repository.dart';
import 'package:news_api/cubit/api_cubit.dart';
import 'package:news_api/home_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiCubit(
        ApiRepository(),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ApiHome(),
      ),
    );
  }
}
