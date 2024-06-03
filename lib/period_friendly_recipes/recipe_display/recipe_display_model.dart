import '/flutter_flow/flutter_flow_util.dart';
import 'recipe_display_widget.dart' show RecipeDisplayWidget;
import 'package:flutter/material.dart';

class RecipeDisplayModel extends FlutterFlowModel<RecipeDisplayWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
