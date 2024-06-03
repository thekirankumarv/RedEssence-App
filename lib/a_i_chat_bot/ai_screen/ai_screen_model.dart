import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ai_screen_widget.dart' show AiScreenWidget;
import 'package:flutter/material.dart';

class AiScreenModel extends FlutterFlowModel<AiScreenWidget> {
  ///  Local state fields for this page.

  String apiResponse = 'unset';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for promptField widget.
  FocusNode? promptFieldFocusNode;
  TextEditingController? promptFieldTextController;
  String? Function(BuildContext, String?)? promptFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (Gemini AI Text)] action in Button widget.
  ApiCallResponse? apiResulttdf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    promptFieldFocusNode?.dispose();
    promptFieldTextController?.dispose();
  }
}
