part of 'bookmark_bloc.dart';

class BookmarkState extends Equatable {
  final GetCityStatus getCityStatus;
  final SaveCityStatus saveCityStatus;
  final GetAllCityStatus getAllCityStatus;
  final DeleteCityStatus deleteCityStatus;

  const BookmarkState({
    required this.getAllCityStatus,
    required this.deleteCityStatus,
    required this.getCityStatus,
    required this.saveCityStatus,
  });

  BookmarkState copyWith({
    SaveCityStatus? newSaveStatus,
    GetCityStatus? newGetStatus,
    GetAllCityStatus? newGetAllCityStatus,
    DeleteCityStatus? newDeleteCityStatus,
  }) {
    return BookmarkState(
      getCityStatus: newGetStatus ?? getCityStatus,
      saveCityStatus: newSaveStatus ?? saveCityStatus,
      getAllCityStatus: newGetAllCityStatus ?? getAllCityStatus,
      deleteCityStatus: newDeleteCityStatus ?? deleteCityStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    getCityStatus,
    saveCityStatus,
    getAllCityStatus,
    deleteCityStatus,
  ];
}
