import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_tutorial_app/constants/theme.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class SourceWeview extends StatefulWidget {
  final String newsUrl;
  const SourceWeview({super.key, required this.newsUrl});

  @override
  State<SourceWeview> createState() => _SourceWeviewState();
}

class _SourceWeviewState extends State<SourceWeview> {
  final Completer<WebViewPlusController> controller =
      Completer<WebViewPlusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Fwhite,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            navigator!.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Fgreen,
            size: 26,
          ),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'FOOD',
                style: GoogleFonts.poppins(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Fgreen,
                ),
              ),
              TextSpan(
                text: 'DOOR',
                style: GoogleFonts.poppins(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
      body: WebViewPlus(
        initialUrl: widget.newsUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewPlusController webViewController) {
          setState(() {
            controller.complete(webViewController);
          });
        },
      ),
    );
  }
}
