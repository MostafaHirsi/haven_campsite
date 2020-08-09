import 'package:equatable/equatable.dart';

class GroupModel extends Equatable {
  final int familyId;
  final int groupSize;
  final int caravan;

  GroupModel({this.familyId, this.groupSize, this.caravan});

  GroupModel copyWith({int familyId, int groupSize, int caravan}) {
    return new GroupModel(
      caravan: caravan ?? this.caravan,
      groupSize: groupSize ?? this.groupSize,
      familyId: familyId ?? this.familyId,
    );
  }

  static GroupModel fromJson(Map<String, dynamic> json)
  {
    return GroupModel(
      caravan: json['caravan'],
      familyId: json['familyid'],
      groupSize: json['groupsize'],
    );
  }

  @override
  List<Object> get props => [familyId, groupSize, caravan];
}
