
// ignore_for_file: eol_at_end_of_file

abstract class DataState<T>{
  final T? data;
  final String? error;

  const DataState(this.data,this.error);
}

class DataSuccess<T> extends DataState<T>{
  DataSuccess(T? data):super(data, null);
}

class DataFailed<T> extends DataState<T>{
  DataFailed(String error):super(null, error);
}