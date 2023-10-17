import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/Controllers/Imagepick.dart';
import 'package:flutter_application_1/app/Models/Theme.dart';
import 'package:flutter_application_1/app/Views/Page/Dashboard.dart';
import 'package:flutter_application_1/app/Views/Widget/Menu.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class profile extends StatelessWidget {

  imagePickerController controller = Get.put(imagePickerController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MyHomePage();
                    }));
        }, icon: const Icon(Icons.arrow_back), color: orangeColor,),
        title: Text('Profile', style: blackTextStyle3.copyWith(fontSize: 20),),
        
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications, color: Color(0xffff9900),),
          )
        ],
      ),
      
      body: Obx((){
        return Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                SizedBox(height: 20,),
            Center(
              child: 
              CircleAvatar(
                radius: 100,
                backgroundImage: controller.imagePath.isNotEmpty ?
                FileImage(File(controller.imagePath.toString())) : 
                  null
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                TextButton(onPressed: (){
              controller.getImageFromGallery();
            }, child: Text('Pilih foto', style: blackTextStyle3.copyWith(fontSize: 10),)),
            TextButton(onPressed: (){
              controller.getImagesFromCamera();
            }, child: Text('Ambil foto', style: blackTextStyle3.copyWith(fontSize: 10),)),
              ],
            ),
            

            Menu(), SizedBox(height: 10,),
            Menu(), SizedBox(height: 10,),
            Menu(), SizedBox(height: 10,),
            Menu(), SizedBox(height: 10,),
            ],
          ),
        );
      })
    );
  }
}