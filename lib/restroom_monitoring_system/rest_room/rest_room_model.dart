import '/flutter_flow/flutter_flow_util.dart';
import 'rest_room_widget.dart' show RestRoomWidget;
import 'package:flutter/material.dart';

class RestRoomModel extends FlutterFlowModel<RestRoomWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
