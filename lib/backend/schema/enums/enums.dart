import 'package:collection/collection.dart';

enum SessionStatus {
  upcoming,
  previous,
  pendingForSum,
}

enum TaskStatus {
  done,
  pending,
  outOfDate,
  assigned,
}

enum Role {
  player,
  coach,
  parent,
}

enum NotificationType {
  task,
  mashov,
  newSession,
}

enum SessionType {
  personal,
  accademy,
  mental,
  mentalGroup,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (SessionStatus):
      return SessionStatus.values.deserialize(value) as T?;
    case (TaskStatus):
      return TaskStatus.values.deserialize(value) as T?;
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (NotificationType):
      return NotificationType.values.deserialize(value) as T?;
    case (SessionType):
      return SessionType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
