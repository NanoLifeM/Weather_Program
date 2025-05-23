// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_program/core/params/forecast_params.dart';
import 'package:weather_program/core/resources/data_state.dart';
import 'package:weather_program/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather_program/features/feature_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'package:weather_program/features/feature_weather/presentation/bloc/cw_status.dart';
import 'package:weather_program/features/feature_weather/presentation/bloc/fw_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;
  final GetForecastWeatherUseCase _getForecastWeatherUseCase;
  HomeBloc(this._getCurrentWeatherUseCase,this._getForecastWeatherUseCase) : super(HomeState(cwStatus: CwLoading(),fwStatus: FwLoading())) {



    on<LoadCwEvent>((event, emit) async {
      emit(state.copyWith(newCwStatus: CwLoading()));

      final DataState dataState=await _getCurrentWeatherUseCase(event.cityName);

      if(dataState is DataSuccess){
      emit(state.copyWith(newCwStatus: CwCompleted(dataState.data)));
      }
      if(dataState is DataFailed){
      emit(state.copyWith(newCwStatus: CwError(dataState.error!)));
      }
    });

    /// load 7 days Forecast weather for city Event
    on<LoadFwEvent>((event, emit) async {

      /// emit State to Loading for just Fw
      emit(state.copyWith(newFwStatus: FwLoading()));

      final DataState dataState = await _getForecastWeatherUseCase(
          event.forecastParams);

      /// emit State to Completed for just Fw
      if (dataState is DataSuccess) {
        emit(state.copyWith(newFwStatus: FwCompleted(dataState.data)));
      }

      /// emit State to Error for just Fw
      if (dataState is DataFailed) {
        emit(state.copyWith(newFwStatus: FwError(dataState.error)));
      }
    });


  }
}
