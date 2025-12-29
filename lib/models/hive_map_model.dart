class HiveMapModel {
 final String name;
 final int age;
 final String gender;

  const HiveMapModel({
   required this.name,
   required this.age, 
   required this.gender});

  Map<String , dynamic> toMap(){
    return{
      "name": name,
      "age": age,
      "gender": gender,
    };
  }
 
  factory HiveMapModel.fromMap(Map<String,dynamic> json){
    return HiveMapModel(
      name: json["name"],
       age: json["age"],
        gender: json["gender"]);
  }
}