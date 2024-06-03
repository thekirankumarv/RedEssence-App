import '/flutter_flow/flutter_flow_util.dart';
import 'story_shared_by_user_widget.dart' show StorySharedByUserWidget;
import 'package:flutter/material.dart';

class StorySharedByUserModel extends FlutterFlowModel<StorySharedByUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
