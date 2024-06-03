import '/flutter_flow/flutter_flow_util.dart';
import 'audio_player_widget.dart' show AudioPlayerWidget;
import 'package:flutter/material.dart';

class AudioPlayerModel extends FlutterFlowModel<AudioPlayerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
