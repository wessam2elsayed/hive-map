import 'package:flutter/material.dart';
import 'package:hive_map/core/app_colors.dart';
import 'package:hive_map/models/hive_map_model.dart';
import 'package:hive_map/models/hive_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final textController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();

  final HiveModel hiveModel=HiveModel();

  @override
  void dispose() {
    textController.dispose();
    ageController.dispose();
    genderController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        foregroundColor: AppColors.blue,
        centerTitle: true,
        title: Text("Hive Task",
        ),
        
       
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          
          children: [
            const SizedBox(height: 20,),
          TextFormField(
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your name"
            ),
          ),

           const SizedBox(height: 20,),

           TextFormField(
            controller: ageController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your age"
            ),
          ),

           const SizedBox(height: 20,),

           TextFormField(
            controller: genderController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your gender"
            ),
          ),

           const SizedBox(height: 20,),
        
          ElevatedButton(
            onPressed: (){
            if(textController.text.isNotEmpty){
              setState(() {
                hiveModel.addData(HiveMapModel(
                  name: textController.text,
                   age: int.parse(ageController.text),
                    gender: genderController.text));
                textController.clear();
              });
            }else{
              print("its empty");
            }
          },
           child: Text("Add")),

           const SizedBox(height: 20,),

             ElevatedButton(
            onPressed: (){
              setState(() {
                hiveModel.box?.clear();
                
              });
           
          },
           child: Text("Delete")),

           const SizedBox(height: 20,),

           Flexible(
             child: ListView.builder(
              shrinkWrap: true,
              itemCount: hiveModel.getData().length,
              itemBuilder: (context,index){
              final data = hiveModel.getData();
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.blue,
                  child: Text(index.toString(),
                  style: TextStyle(
                    color: AppColors.darkBlue
                  ),),
                ),
                title: Text(data[index].name,
                 style: TextStyle(
                    color: AppColors.darkBlue
                  ),),
                  subtitle: Text(data[index].gender),
                  trailing: Text(data[index].age.toString()),
              );
             }),
           )
        ],),
      ),
    );
  }
}