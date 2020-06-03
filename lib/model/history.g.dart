// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryAdapter extends TypeAdapter<History> {
  @override
  History read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return History(
      fields[0] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, History obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.time);
  }

  @override
  int get typeId => 0;
}
