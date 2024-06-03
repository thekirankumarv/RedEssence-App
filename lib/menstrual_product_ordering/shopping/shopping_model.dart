import '/flutter_flow/flutter_flow_util.dart';
import 'shopping_widget.dart' show ShoppingWidget;
import 'package:flutter/material.dart';

class ShoppingModel extends FlutterFlowModel<ShoppingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
