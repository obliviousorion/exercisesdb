import 'dart:convert';

List<ExerciseModel> exerciseModelFromJson(String str) =>
    List<ExerciseModel>.from(
        json.decode(str).map((x) => ExerciseModel.fromJson(x)));

String exerciseModelToJson(List<ExerciseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExerciseModel {
  String bodyPart;
  String equipment;
  String gifUrl;
  String id;
  String name;
  String target;
  List<String> secondaryMuscles;
  List<String> instructions;

  ExerciseModel({
    required this.bodyPart,
    required this.equipment,
    required this.gifUrl,
    required this.id,
    required this.name,
    required this.target,
    required this.secondaryMuscles,
    required this.instructions,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        bodyPart: json["bodyPart"],
        equipment: json["equipment"],
        gifUrl: json["gifUrl"],
        id: json["id"],
        name: json["name"],
        target: json["target"],
        secondaryMuscles:
            List<String>.from(json["secondaryMuscles"].map((x) => x)),
        instructions: List<String>.from(json["instructions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "bodyPart": bodyPart,
        "equipment": equipment,
        "gifUrl": gifUrl,
        "id": id,
        "name": name,
        "target": target,
        "secondaryMuscles": List<dynamic>.from(secondaryMuscles.map((x) => x)),
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
      };

  @override
  String toString() {
    return 'ExerciseModel{name: $name, bodyPart: $bodyPart, equipment: $equipment, target: $target, secondaryMuscles: $secondaryMuscles}';
  }
}
