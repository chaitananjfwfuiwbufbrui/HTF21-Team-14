class EquipmentModel {
  int? id;
  String? name;
  String? image;
  int? sportAssociatewith;

  EquipmentModel({this.id, this.name, this.image, this.sportAssociatewith});

  EquipmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    sportAssociatewith = json['sport_associatewith'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['sport_associatewith'] = sportAssociatewith;
    return data;
  }
}
