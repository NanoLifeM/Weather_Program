
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
// ignore: must_be_immutable
class City extends Equatable{


  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;

  City({required this.name});

  @override
  // TODO: implement props
  List<Object?> get props =>[name];

}
