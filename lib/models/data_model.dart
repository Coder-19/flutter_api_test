// the code below is used to create a model class for getting the data
class DataModel {
  String? name;
  String? description;
  String? category;

  // initializing above properties
  DataModel({
    this.category,
    this.description,
    this.name,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      category: json['Category'],
      name: json["API"],
      description: json["Description"],
    );
  }
}
