import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:invoice_generator_damo/utils/globle_value.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as play;
import 'package:printing/printing.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => pdfGentrater(),
      ),
    );
  }
}

// 1. What is StatelessWidget?
// StatelessWidget is a concept in Flutter, a UI framework for building mobile and web
// applications, where the widget is immutable and does not change its state over time. It
// represents a widget that always renders the same output based on the given input and does not
// maintain any internal state.


Future<Uint8List> pdfGentrater() {
  final pdf = play.Document();
  pdf.addPage(
    play.MultiPage(
      build: (context) => [
        ...List.generate(
          textAllValueList.length,
          (index) => play.Container(
            child: play.Column(
              children: [
                play.Table(
                  border: play.TableBorder.all(color: PdfColors.black),
                  children: [
                    play.TableRow(
                      children: [
                        play.Expanded(child: play.Container()),
                        play.Expanded(child: play.Container()),
                      ],
                    ),
                    play.TableRow(
                      children: [
                        play.Row(
                          children: [
                            play.SizedBox(
                              width: 10,
                            ),
                            play.Text('Product Name :',
                                style: const play.TextStyle(fontSize: 20)),
                          ],
                        ),
                        play.Row(
                          children: [
                            play.SizedBox(
                              width: 10,
                            ),
                            play.Text(
                                textAllValueList[index].txtProductName!.text,
                                style: const play.TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                    play.TableRow(
                      children: [
                        play.Row(
                          children: [
                            play.SizedBox(
                              width: 10,
                            ),
                            play.Text('Product Price :',
                                style: const play.TextStyle(fontSize: 20)),
                          ],
                        ),
                        play.Row(
                          children: [
                            play.SizedBox(
                              width: 10,
                            ),
                            play.Text(
                                'Rs ${textAllValueList[index].txtProductPrice!.text}',
                                style: const play.TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                    play.TableRow(
                      children: [
                        play.Row(
                          children: [
                            play.SizedBox(
                              width: 10,
                            ),
                            play.Text('Product Gst :',
                                style: const play.TextStyle(fontSize: 20)),
                          ],
                        ),
                        play.Row(
                          children: [
                            play.SizedBox(
                              width: 10,
                            ),
                            play.Text(
                                '${textAllValueList[index].txtProductGST!.text}%',
                                style: const play.TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                    play.TableRow(
                      children: [
                        play.Row(
                          children: [
                            play.SizedBox(
                              width: 10,
                            ),
                            play.Text('Total Bill :',
                                style: play.TextStyle(fontSize: 20)),
                          ],
                        ),
                        play.Row(
                          children: [
                            play.SizedBox(
                              width: 10,
                            ),
                            play.Text(
                                'Rs ${(double.parse(textAllValueList[index].txtProductPrice!.text)/100*double.parse(textAllValueList[index].txtProductGST!.text)+double.parse(textAllValueList[index].txtProductPrice!.text))}',
                                style: play.TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                play.SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
  return pdf.save();
}
