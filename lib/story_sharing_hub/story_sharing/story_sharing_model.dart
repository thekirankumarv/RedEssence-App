import '/flutter_flow/flutter_flow_util.dart';
import 'story_sharing_widget.dart' show StorySharingWidget;
import 'package:flutter/material.dart';

class StorySharingModel extends FlutterFlowModel<StorySharingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
