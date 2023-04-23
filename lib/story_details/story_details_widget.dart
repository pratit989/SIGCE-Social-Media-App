import '/backend/backend.dart';
import '/components/comments_widget.dart';
import '/components/delete_story_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'story_details_model.dart';
export 'story_details_model.dart';

class StoryDetailsWidget extends StatefulWidget {
  const StoryDetailsWidget({
    Key? key,
    this.initialStoryIndex,
  }) : super(key: key);

  final int? initialStoryIndex;

  @override
  _StoryDetailsWidgetState createState() => _StoryDetailsWidgetState();
}

class _StoryDetailsWidgetState extends State<StoryDetailsWidget> {
  late StoryDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'storyDetails',
        color: FlutterFlowTheme.of(context).primary,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryDark,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: StreamBuilder<List<UserStoriesRecord>>(
                    stream: queryUserStoriesRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      }
                      List<UserStoriesRecord> pageViewUserStoriesRecordList =
                          snapshot.data!;
                      if (pageViewUserStoriesRecordList.isEmpty) {
                        return Center(
                          child: Image.asset(
                            'assets/images/SIGCE_Name_White.png',
                            width: double.infinity,
                          ),
                        );
                      }
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: min(
                                          valueOrDefault<int>(
                                            widget.initialStoryIndex,
                                            0,
                                          ),
                                          pageViewUserStoriesRecordList.length -
                                              1)),
                              scrollDirection: Axis.vertical,
                              itemCount: pageViewUserStoriesRecordList.length,
                              itemBuilder: (context, pageViewIndex) {
                                final pageViewUserStoriesRecord =
                                    pageViewUserStoriesRecordList[
                                        pageViewIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.82,
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                pageViewUserStoriesRecord
                                                    .storyPhoto,
                                                'https://images.shiksha.com/mediadata/images/1589784998phpFLlyPi.jpeg',
                                              ),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  1.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 102.0,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryDark,
                                                        Color(0x001A1F24)
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    16.0,
                                                                    36.0),
                                                        child: StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  pageViewUserStoriesRecord
                                                                      .user!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final userInfoUsersRecord =
                                                                snapshot.data!;
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      userInfoUsersRecord
                                                                          .photoUrl,
                                                                      'data:image/png;base64,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',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            userInfoUsersRecord.displayName,
                                                                            'Good Dog',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Urbanist',
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          userInfoUsersRecord
                                                                              .userName!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Urbanist',
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (pageViewUserStoriesRecord
                                                                        .isOwner ??
                                                                    true)
                                                                  Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .dark600,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              60.0),
                                                                    ),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          30.0,
                                                                      buttonSize:
                                                                          46.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .more_vert,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .grayIcon,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Color(0x00000000),
                                                                          barrierColor:
                                                                              Color(0x00000000),
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (bottomSheetContext) {
                                                                            return Padding(
                                                                              padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                              child: Container(
                                                                                height: 240.0,
                                                                                child: DeleteStoryWidget(
                                                                                  storyDetails: pageViewUserStoriesRecord,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                    ),
                                                                  ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .dark600,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            60.0),
                                                                  ),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30.0,
                                                                    buttonSize:
                                                                        46.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .close_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayIcon,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      context
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0x001A1F24),
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryDark
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            pageViewUserStoriesRecord
                                                                .storyDescription,
                                                            'This is where the comment will go, okay! I can\'t beleive this is what it seems like!',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Color(0x00000000),
                                                barrierColor: Color(0x00000000),
                                                context: context,
                                                builder: (bottomSheetContext) {
                                                  return Padding(
                                                    padding: MediaQuery.of(
                                                            bottomSheetContext)
                                                        .viewInsets,
                                                    child: Container(
                                                      height: 600.0,
                                                      child: CommentsWidget(
                                                        story:
                                                            pageViewUserStoriesRecord,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.mode_comment_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    pageViewUserStoriesRecord
                                                        .numComments!
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                if (!isWeb)
                                                  Builder(
                                                    builder: (context) =>
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      buttonSize: 48.0,
                                                      icon: Icon(
                                                        Icons.bookmark_border,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
                                                        await Share.share(
                                                          'This post is really awesome!',
                                                          sharePositionOrigin:
                                                              getWidgetBoundingBox(
                                                                  context),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.95, 0.7),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: min(
                                              valueOrDefault<int>(
                                                widget.initialStoryIndex,
                                                0,
                                              ),
                                              pageViewUserStoriesRecordList
                                                      .length -
                                                  1)),
                                  count: pageViewUserStoriesRecordList.length,
                                  axisDirection: Axis.vertical,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController!
                                        .animateToPage(
                                      i,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  effect:
                                      smooth_page_indicator.ExpandingDotsEffect(
                                    expansionFactor: 2.0,
                                    spacing: 8.0,
                                    radius: 16.0,
                                    dotWidth: 8.0,
                                    dotHeight: 4.0,
                                    dotColor: Color(0x65DBE2E7),
                                    activeDotColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
