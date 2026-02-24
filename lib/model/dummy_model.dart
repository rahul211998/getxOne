class DummyModel {
  final String id;
  final String title;
  final String description;
  final int version;

  DummyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.version,
  });

  factory DummyModel.fromJson(Map<String, dynamic> json) {
    return DummyModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      version: json['__v'],
    );
  }
}
