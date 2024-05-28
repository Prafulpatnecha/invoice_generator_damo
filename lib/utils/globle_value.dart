import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

GlobalKey<FormState> fromkey=GlobalKey();
List<ProductModel> textAllValueList =[];
TextEditingController txtProductName=TextEditingController();
TextEditingController txtProductPrice=TextEditingController();
TextEditingController txtProductGST=TextEditingController();

class ProductModel
{
  TextEditingController? txtProductName;
  TextEditingController? txtProductPrice;
  TextEditingController? txtProductGST;
  File? fileimage;
  ProductModel({this.txtProductName,this.txtProductGST,this.txtProductPrice,this.fileimage});
}
ImagePicker imagePicker=ImagePicker();
File? fileimage;