import 'package:flutter/material.dart';

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
  ProductModel({this.txtProductName,this.txtProductGST,this.txtProductPrice});
}