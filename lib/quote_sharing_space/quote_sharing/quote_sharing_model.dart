import '/flutter_flow/flutter_flow_util.dart';
import '/quote_sharing_space/upload_component/upload_component_widget.dart';
import 'quote_sharing_widget.dart' show QuoteSharingWidget;
import 'package:flutter/material.dart';

class QuoteSharingModel extends FlutterFlowModel<QuoteSharingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UploadComponent component.
  late UploadComponentModel uploadComponentModel;

  @override
  void initState(BuildContext context) {
    uploadComponentModel = createModel(context, () => UploadComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    uploadComponentModel.dispose();
  }
}
