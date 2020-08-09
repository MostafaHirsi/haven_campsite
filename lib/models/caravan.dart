import 'package:equatable/equatable.dart';

class CaravanModel extends Equatable {
  final int id;

  CaravanModel({this.id});

  CaravanModel copyWith({final int id}) {
    return CaravanModel(id: id ?? this.id);
  }

  @override
  List<Object> get props => [id];
}
