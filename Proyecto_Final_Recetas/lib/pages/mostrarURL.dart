import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MostrarURL extends StatelessWidget {
  String enlace;
   MostrarURL({Key? key, required this.enlace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receta', style: TextStyle(fontSize: 25),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),

      body: SafeArea(
        child: Center(
          child: WebView(
            initialUrl: enlace,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),

    );
  }
}
