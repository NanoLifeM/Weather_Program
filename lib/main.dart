import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_program/core/widgets/main_wrapper.dart';
import 'package:weather_program/features/feature_bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:weather_program/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:weather_program/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      hintColor: Colors.blueAccent,
      scaffoldBackgroundColor: const Color(0xFFF2F2F7),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    home: MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<HomeBloc>()),
        BlocProvider(create: (_) => locator<BookmarkBloc>())
      ],
      child: MainWrapper(),
    ),
  ));
}
