import '/flutter_flow/flutter_flow_util.dart';
import 'quote_shared_by_user_widget.dart' show QuoteSharedByUserWidget;
import 'package:flutter/material.dart';

class QuoteSharedByUserModel extends FlutterFlowModel<QuoteSharedByUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
