import 'package:flutter/material.dart';

import '../home/homepage/home_screen.dart';
import '../home/pdfscreen/pdf_page.dart';
import '../home/viwescreen/view_page.dart';

class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes={
    '/':(context)=>const HomePage(),
    '/view':(context)=>const ViewPage(),
    '/pdf':(context)=>const PdfPage(),
  };
}