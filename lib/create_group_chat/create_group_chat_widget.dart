import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CreateGroupChatWidget extends StatefulWidget {
  const CreateGroupChatWidget({Key? key}) : super(key: key);

  @override
  _CreateGroupChatWidgetState createState() => _CreateGroupChatWidgetState();
}

class _CreateGroupChatWidgetState extends State<CreateGroupChatWidget> {
  Map<UsersRecord, bool> checkboxListTileValueMap = {};
  List<UsersRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  PagingController<DocumentSnapshot?, UsersRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  TextEditingController? textController;
  ChatsRecord? groupChat;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'createGroupChat',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 24,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Group Chat',
                  style: FlutterFlowTheme.of(context).subtitle1,
                ),
                Text(
                  'Select the friends to add to chat.',
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(0),
                ),
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 1),
                  child: TextFormField(
                    controller: textController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Search for friends...',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(24, 14, 0, 0),
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ),
              Expanded(
                child: PagedListView<DocumentSnapshot<Object?>?, UsersRecord>(
                  pagingController: () {
                    final Query<Object?> Function(Query<Object?>) queryBuilder =
                        (usersRecord) => usersRecord;
                    if (_pagingController != null) {
                      final query = queryBuilder(UsersRecord.collection);
                      if (query != _pagingQuery) {
                        // The query has changed
                        _pagingQuery = query;
                        _streamSubscriptions.forEach((s) => s?.cancel());
                        _streamSubscriptions.clear();
                        _pagingController!.refresh();
                      }
                      return _pagingController!;
                    }

                    _pagingController = PagingController(firstPageKey: null);
                    _pagingQuery = queryBuilder(UsersRecord.collection);
                    _pagingController!.addPageRequestListener((nextPageMarker) {
                      queryUsersRecordPage(
                        queryBuilder: (usersRecord) => usersRecord,
                        nextPageMarker: nextPageMarker,
                        pageSize: 25,
                        isStream: true,
                      ).then((page) {
                        _pagingController!.appendPage(
                          page.data,
                          page.nextPageMarker,
                        );
                        final streamSubscription =
                            page.dataStream?.listen((data) {
                          final itemIndexes = _pagingController!.itemList!
                              .asMap()
                              .map((k, v) => MapEntry(v.reference.id, k));
                          data.forEach((item) {
                            final index = itemIndexes[item.reference.id];
                            final items = _pagingController!.itemList!;
                            if (index != null) {
                              items.replaceRange(index, index + 1, [item]);
                              _pagingController!.itemList = {
                                for (var item in items) item.reference: item
                              }.values.toList();
                            }
                          });
                          setState(() {});
                        });
                        _streamSubscriptions.add(streamSubscription);
                      });
                    });
                    return _pagingController!;
                  }(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  builderDelegate: PagedChildBuilderDelegate<UsersRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    ),

                    itemBuilder: (context, _, listViewIndex) {
                      final listViewUsersRecord =
                          _pagingController!.itemList![listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                        child: Container(
                          width: double.infinity,
                          height: 70,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFF4E39F9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 2, 2, 2),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        listViewUsersRecord.photoUrl!,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 0, 0),
                                    child: Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                      child: CheckboxListTile(
                                        value: checkboxListTileValueMap[
                                            listViewUsersRecord] ??= false,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              checkboxListTileValueMap[
                                                      listViewUsersRecord] =
                                                  newValue!);
                                        },
                                        title: Text(
                                          listViewUsersRecord.displayName!,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                        subtitle: Text(
                                          listViewUsersRecord.email!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF4E39F9),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x3314181B),
                      offset: Offset(0, -2),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
                  child: FFButtonWidget(
                    onPressed: () async {
                      groupChat = await FFChatManager.instance.createChat(
                        checkboxListTileCheckedItems
                            .map((e) => e.reference)
                            .toList(),
                      );
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        'chatPage',
                        queryParams: {
                          'chatRef': serializeParam(
                            groupChat!.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );

                      setState(() {});
                    },
                    text: 'Create Chat',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: Color(0xFF4E39F9),
                      textStyle: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
