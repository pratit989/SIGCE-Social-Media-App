import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_chats_page_model.dart';
export 'empty_chats_page_model.dart';

class EmptyChatsPageWidget extends StatefulWidget {
  const EmptyChatsPageWidget({Key? key}) : super(key: key);

  @override
  _EmptyChatsPageWidgetState createState() => _EmptyChatsPageWidgetState();
}

class _EmptyChatsPageWidgetState extends State<EmptyChatsPageWidget> {
  late EmptyChatsPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyChatsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Image.asset(
            'assets/images/SIGCE_Name_White.png',
            width: double.infinity,
            height: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        SelectionArea(
            child: Text(
          'Click the + icon to start a chat',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).headlineSmall,
        )),
      ],
    );
  }
}
