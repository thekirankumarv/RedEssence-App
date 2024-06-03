import '/flutter_flow/flutter_flow_util.dart';
import 'upload_recipe_widget.dart' show UploadRecipeWidget;
import 'package:flutter/material.dart';

class UploadRecipeModel extends FlutterFlowModel<UploadRecipeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for recipeName widget.
  FocusNode? recipeNameFocusNode;
  TextEditingController? recipeNameTextController;
  String? Function(BuildContext, String?)? recipeNameTextControllerValidator;
  String? _recipeNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 25) {
      return 'Minimum 25 characters required ';
    }
    if (val.length > 1000) {
      return 'Maximum allowed characters is 1000';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    recipeNameTextControllerValidator = _recipeNameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    recipeNameFocusNode?.dispose();
    recipeNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
