import 'package:flutter/material.dart';
import 'package:match_work/utils/color.dart';

abstract class BaseStatefulWidgetState<statefulWidget extends StatefulWidget> extends State<statefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(appBarTitle()),
          centerTitle: true,
          backgroundColor: purple,
          automaticallyImplyLeading: isCanGoBack()??false),
      body: SafeArea(
        child: buildWidget(),
      ),
    );
  }

  Widget buildWidget();
  String appBarTitle();
  bool isCanGoBack();
}
