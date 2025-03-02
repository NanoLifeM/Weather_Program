
// ignore_for_file: eol_at_end_of_file

abstract class UseCase<T,P>{
 Future<T> call(P param);
}
class NoParams{}