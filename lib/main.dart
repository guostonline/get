import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_teset/GetController.dart';

void main() {
  runApp(GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  CounterController _controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                      child: Text("increment"),
                      onPressed: () => _controller.increment()),
                  Obx(() => Text(_controller.count.value.toString())),
                  RaisedButton(
                      child: Text("decriment"),
                      onPressed: () => _controller.decrement()),
                ],
              ),
              RaisedButton(
                child: Text("test snackbar"),
                onPressed: () => _showMaterialDialog(context),

                //() => Get.snackbar("title", "message"),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showMaterialDialog(context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Material Dialog"),
              content: new Text("Hey! I'm Coflutter!"),
              actions: <Widget>[
                FlatButton(
                  child: Obx(() => Text(_controller.count.value.toString())),
                  onPressed: () {
                    _controller.increment();
                    Navigator.pop(context);

                    Get.snackbar("title", "waaaaw");
                  },
                )
              ],
            ));
  }
}
