import '/flutter_flow/flutter_flow_util.dart';
import 'out_team_widget.dart' show OutTeamWidget;
import 'package:flutter/material.dart';

class OutTeamModel extends FlutterFlowModel<OutTeamWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
