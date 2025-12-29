import 'package:hive/hive.dart';
import 'package:hive_map/models/hive_map_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveModel {
  static final HiveModel _hiveModel=HiveModel._internal();
  factory HiveModel()=>_hiveModel;
  HiveModel._internal();
  Box? box;

  Future<Box>init()async{
    if(!Hive.isBoxOpen("myBox")){
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
    }
    box = await Hive.openBox("myBox");
    return box!;

  }

  void addData(HiveMapModel value){
    box!.add(value.toMap());
  }


  List<HiveMapModel> getData(){
    return box?.values.map((e)=>HiveMapModel.fromMap(e)).toList()??[];
  }


  

  void deleteData(int index){
    box!.deleteAt(index);
  }



}