import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/globle_value.dart';
import 'components/containers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromkey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Invoice Generator', style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: SizedBox(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ...List.generate(textAllValueList.length, (index) =>
                    buildColumn(index: index),),
                IconButton(onPressed: () {
                  setState(() {
                    TextEditingController txtProductName = TextEditingController();
                    TextEditingController txtProductPrice = TextEditingController();
                    File? fileimage;
                    TextEditingController txtProductGST = TextEditingController();
                    textAllValueList.add(ProductModel(
                        txtProductGST: txtProductGST,
                        txtProductName: txtProductName,
                        txtProductPrice: txtProductPrice,
                        fileimage: fileimage));
                  });
                  // fromkey.currentState!.validate();
                },
                    icon: const Icon(
                      Icons.add_circle, color: Colors.blue, size: 40,))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade50,
          onPressed: () {
            setState(() {
              // ScaffoldMessenger(child: SnackBar(content: Text('data')),);
              // showDialog(context: context, builder: (context) {
              //   return Text('data');
              // },);
              int check=0;
              for(int i=0; i<textAllValueList.length;i++)
                {
                  if (textAllValueList[i].fileimage!=null) {
                    check++;
                  }
                }

                  if (
                  fromkey.currentState!.validate() && textAllValueList.isNotEmpty && check==textAllValueList.length
                  ) {
                    Navigator.of(context).pushNamed('/view');
                  }
                  else {
                    if(textAllValueList.length!=check)
                      {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Image Not Found')));
                      }
                  }
            });
          },
          child: const Icon(Icons.sensor_door_outlined),
        ),
      ),
    );
  }

  Widget buildColumn({required int index}) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        GestureDetector(
          onTap: () async {
            XFile? xfileimage = await imagePicker.pickImage(
                source: ImageSource.gallery);
            setState(() {
              textAllValueList[index].fileimage = File(xfileimage!.path);
            });
          },
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            backgroundImage: (textAllValueList[index].fileimage != null)
                ? FileImage(textAllValueList[index].fileimage!)
                : null,
            child: const Align(
                alignment: Alignment.bottomRight,
                child: Icon(Icons.image)),
          ),
        ),
        const SizedBox(height: 20,),
        ListTile(
          title: textFormFieldDetails(
              textfind: 'Fill Product Name',
              validatorfind: (value) {
                if (value
                    .toString()
                    .isEmpty) {
                  return 'Filled will be must required';
                }
                return null;
              },
              keyboardTypeFind: TextInputType.text,
              controllerFind: textAllValueList[index].txtProductName!),
        ),
        ListTile(
          title: textFormFieldDetails(
              textfind: 'Fill Product Price',
              validatorfind: (value) {
                if (value
                    .toString()
                    .isEmpty) {
                  return 'Filled will be must required';
                }
                else if (value.toString().contains(
                    RegExp(r'[-!@#$%^&* (),?":{}|<>]'))) {
                  return 'Only Numbers Allow';
                }
                else if (value.toString().contains(RegExp(r'[a-z]')) ||
                    value.toString().contains(RegExp(r'[A-Z]'))) {
                  return 'Only Numbers Allow';
                }
                return null;
              },
              keyboardTypeFind: TextInputType.number,
              controllerFind: textAllValueList[index].txtProductPrice!),
        ),
        ListTile(
          title: textFormFieldDetails(textfind: 'Fill Product GST',
              validatorfind: (value) {
                if (value
                    .toString()
                    .isEmpty) {
                  return 'Filled will be must required';
                }
                else if (value.toString().contains(
                    RegExp(r'[-!@#$%^&* (),?":{}|<>]'))) {
                  return 'Only Numbers Allow';
                }
                else if (value.toString().contains(RegExp(r'[a-z]'))) {
                  return 'Only Numbers Allow';
                }
                else if (value.toString().contains(RegExp(r'[A-Z]'))) {
                  return 'Only Numbers Allow';
                }
                return null;
              },
              keyboardTypeFind: TextInputType.number,
              controllerFind: textAllValueList[index].txtProductGST!),
        ),
        IconButton(onPressed: () {
          setState(() {
            textAllValueList.removeAt(index);
          });
        },
          icon: const Icon(
            Icons.highlight_remove_outlined, color: Colors.blue,),),
        const Divider(),
      ],
    );
  }
}