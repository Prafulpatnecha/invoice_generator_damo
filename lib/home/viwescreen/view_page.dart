import 'package:flutter/material.dart';
import 'package:invoice_generator_damo/utils/globle_value.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('View Bills'),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              ...List.generate(
                textAllValueList.length,
                (index) => ListTile(
                  title: Text(textAllValueList[index].txtProductName!.text,style: const TextStyle(color: Colors.black,fontSize: 20),),
                  subtitle: Text('${textAllValueList[index].txtProductGST!.text} %'),
                  trailing: Text('Rs ${textAllValueList[index].txtProductPrice!.text}',style: const TextStyle(color: Colors.black45,fontSize: 18),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
