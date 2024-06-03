import '/flutter_flow/flutter_flow_util.dart';
import 'educational_videos_widget.dart' show EducationalVideosWidget;
import 'package:flutter/material.dart';

class EducationalVideosModel extends FlutterFlowModel<EducationalVideosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
