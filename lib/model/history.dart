import 'package:hive/hive.dart';

part 'history.g.dart';

@HiveType(typeId: 0)
class History {
  @HiveField(0)
  final DateTime time;

  History(this.time);
}
