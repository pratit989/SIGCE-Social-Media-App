import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyChatsPageWidget extends StatefulWidget {
  const EmptyChatsPageWidget({Key? key}) : super(key: key);

  @override
  _EmptyChatsPageWidgetState createState() => _EmptyChatsPageWidgetState();
}

class _EmptyChatsPageWidgetState extends State<EmptyChatsPageWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Image.asset(
            'assets/images/SIGCE_Name_White.png',
            width: double.infinity,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        SelectionArea(
            child: Text(
          'Click the + icon to start a chat',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).title3,
        )),
      ],
    );
  }
}
