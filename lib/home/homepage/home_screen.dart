import 'package:flutter/material.dart';

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
          title: const Text('Invoice Generator',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(textAllValueList.length, (index) => buildColumn(index: index),),
                IconButton(onPressed: () {
                  setState(() {

                  TextEditingController txtProductName=TextEditingController();
                  TextEditingController txtProductPrice=TextEditingController();
                  TextEditingController txtProductGST=TextEditingController();
                  textAllValueList.add(ProductModel(txtProductGST: txtProductGST,txtProductName:txtProductName,txtProductPrice: txtProductPrice));
                  });
                  // fromkey.currentState!.validate();
                }, icon: const Icon(Icons.add_circle,color: Colors.blue,size: 40,))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade50,
          onPressed: () {
            setState(() {
              if(
              fromkey.currentState!.validate() && textAllValueList.isNotEmpty
              )
                {
                  Navigator.of(context).pushNamed('/view');
                }
            });
          },
          child: Icon(Icons.sensor_door_outlined),
        ),
      ),
    );
  }
  Column buildColumn({required int index}) {
    return Column(
              children: [
                const SizedBox(height: 20,),
                ListTile(
                  title: textFormFieldDetails(textfind: 'Fill Product Name', validatorfind: (value) {
                    if(value.toString().isEmpty)
                    {
                      return 'Filled will be must required';
                    }
                    return null;
                  }, keyboardTypeFind: TextInputType.text, controllerFind: textAllValueList[index].txtProductName!),
                ),
                ListTile(
                  title: textFormFieldDetails(textfind: 'Fill Product Price', validatorfind: (value) {
                    if(value.toString().isEmpty)
                      {
                        return 'Filled will be must required';
                      }
                    else if(value.toString().contains(RegExp(r'[-!@#$%^&* (),.?":{}|<>]')))
                    {
                        return 'Only Numbers Allow';
                    }
                    else if(value.toString().contains(RegExp(r'[a-z]'))||value.toString().contains(RegExp(r'[A-Z]')))
                      {
                        return 'Only Numbers Allow';
                      }
                    return null;
                    }, keyboardTypeFind: TextInputType.number, controllerFind: textAllValueList[index].txtProductPrice!),
                ),
                ListTile(
                  title: textFormFieldDetails(textfind: 'Fill Product GST',
                      validatorfind: (value) {
                    if(value.toString().isEmpty)
                      {
                        return 'Filled will be must required';
                      }
                    else if(value.toString().contains(RegExp(r'[-!@#$%^&* (),?":{}|<>]')))
                      {
                        return 'Only Numbers Allow';
                      }
                    else if(value.toString().contains(RegExp(r'[a-z]')))
                      {
                        return 'Only Numbers Allow';
                      }
                    else if(value.toString().contains(RegExp(r'[A-Z]')))
                      {
                        return 'Only Numbers Allow';
                      }
                    return null;
                  }, keyboardTypeFind: TextInputType.number, controllerFind: textAllValueList[index].txtProductGST!),
                ),
                IconButton(onPressed: () {
                  setState(() {
                    textAllValueList.removeAt(index);
                  });
                }, icon: const Icon(Icons.highlight_remove_outlined,color: Colors.blue,),),
                Divider()
              ],
            );
  }
}
