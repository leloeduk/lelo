// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuoteAdapter extends TypeAdapter<Quote> {
  @override
  final int typeId = 0;

  @override
  Quote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Quote(
      id: fields[0] as int,
      text: fields[1] as String,
      author: fields[2] as String,
      category: fields[3] as String,
      verse: fields[4] as String?,
      testimony: fields[5] as String?,
      lang: fields[6] as String,
      tags: (fields[7] as List).cast<String>(),
      createdAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Quote obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.verse)
      ..writeByte(5)
      ..write(obj.testimony)
      ..writeByte(6)
      ..write(obj.lang)
      ..writeByte(7)
      ..write(obj.tags)
      ..writeByte(8)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
