// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_program/core/resources/data_state.dart';
import 'package:weather_program/core/usecase/use_case.dart';
import 'package:weather_program/features/feature_bookmark/domain/use_cases/delete_city_usecase.dart';
import 'package:weather_program/features/feature_bookmark/domain/use_cases/get_all_city_usecase.dart';
import 'package:weather_program/features/feature_bookmark/domain/use_cases/get_city_usecase.dart';
import 'package:weather_program/features/feature_bookmark/domain/use_cases/save_city_usecase.dart';
import 'package:weather_program/features/feature_bookmark/presentation/bloc/delete_city_status.dart';
import 'package:weather_program/features/feature_bookmark/presentation/bloc/get_all_city_status.dart';
import 'package:weather_program/features/feature_bookmark/presentation/bloc/get_city_status.dart';
import 'package:weather_program/features/feature_bookmark/presentation/bloc/save_city_status.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  GetCityUseCase getCityUseCase;
  SaveCityUseCase saveCityUseCase;
  GetAllCityUseCase getAllCityUseCase;
  DeleteCityUseCase deleteCityUseCase;

  BookmarkBloc(
    this.getCityUseCase,
    this.saveCityUseCase,
    this.getAllCityUseCase,
    this.deleteCityUseCase,
  ) : super(
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityInitial(),
        ),
      ) {
    on<DeleteCityEvent>((event, emit) async {
      /// emit Loading state
      emit(state.copyWith(newDeleteCityStatus: DeleteCityLoading()));

      final DataState dataState = await deleteCityUseCase(event.name);

      /// emit Complete state
      if (dataState is DataSuccess) {
        emit(
          state.copyWith(
            newDeleteCityStatus: DeleteCityCompleted(dataState.data),
          ),
        );
      }

      /// emit Error state
      if (dataState is DataFailed) {
        emit(
          state.copyWith(
            newDeleteCityStatus: DeleteCityError(dataState.error),
          ),
        );
      }
    });

    on<GetCityByNameEvent>((event, emit) async {
      /// emit Loading state
      emit(state.copyWith(newGetStatus: GetCityLoading()));

      final DataState dataState = await getCityUseCase(event.cityName);

      /// emit Complete state
      if (dataState is DataSuccess) {
        emit(state.copyWith(newGetStatus: GetCityCompleted(dataState.data)));
      }

      /// emit Error state
      if (dataState is DataFailed) {
        emit(state.copyWith(newGetStatus: GetCityError(dataState.error)));
      }
    });
    on<GetAllCityEvent>((event, emit) async {
      /// emit Loading state
      emit(state.copyWith(newGetAllCityStatus: GetAllCityLoading()));

      final DataState dataState = await getAllCityUseCase(NoParams());

      /// emit Complete state
      if (dataState is DataSuccess) {
        emit(
          state.copyWith(
            newGetAllCityStatus: GetAllCityCompleted(dataState.data),
          ),
        );
      }

      /// emit Error state
      if (dataState is DataFailed) {
        emit(
          state.copyWith(newGetAllCityStatus: GetAllCityError(dataState.error)),
        );
      }
    });

    /// Save City Event
    on<SaveCwEvent>((event, emit) async {
      /// emit Loading state
      emit(state.copyWith(newSaveStatus: SaveCityLoading()));

      final DataState dataState = await saveCityUseCase(event.name);

      /// emit Complete state
      if (dataState is DataSuccess) {
        emit(state.copyWith(newSaveStatus: SaveCityCompleted(dataState.data)));
      }

      /// emit Error state
      if (dataState is DataFailed) {
        emit(state.copyWith(newSaveStatus: SaveCityError(dataState.error)));
      }
    });

    /// Save city initialize
    ///set to init again SaveCity (برای بار دوم و سوم و غیره باید وضعیت دوباره به حالت اول برگرده وگرنه بوکمارک پر خواهد ماند)
    // ignore: unnecessary_async
    on<SaveCityInitialEvent>((event, emit) async {
      emit(state.copyWith(newSaveStatus: SaveCityInitial()));
    });
  }
}
