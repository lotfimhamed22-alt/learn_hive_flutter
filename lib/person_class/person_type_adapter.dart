import 'package:apply_hive_course/person_class/person_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PersonTypeAdapter extends TypeAdapter<PersonClass> {
  @override
  PersonClass read(BinaryReader reader) {
    return PersonClass(
      name: reader.readString(),
      age: reader.readInt(),
      friends: reader.readList().cast<PersonClass>(),
    );
  }

  @override
  int get typeId => 0; // each class must have unique id

  @override
  void write(BinaryWriter writer, PersonClass obj) {
    writer.writeString(obj.name);
    writer.writeInt(obj.age);
    writer.writeList(obj.friends);
  }
}
