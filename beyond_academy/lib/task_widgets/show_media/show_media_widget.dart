import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'show_media_model.dart';
export 'show_media_model.dart';

class ShowMediaWidget extends StatefulWidget {
  const ShowMediaWidget({
    super.key,
    this.mediaPathImage,
    this.mediaPathVideo,
  });

  final String? mediaPathImage;
  final String? mediaPathVideo;

  @override
  State<ShowMediaWidget> createState() => _ShowMediaWidgetState();
}

class _ShowMediaWidgetState extends State<ShowMediaWidget> {
  late ShowMediaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowMediaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width < kBreakpointSmall
                ? double.infinity
                : 1000.0,
            height: 500.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 25.0
                              : 35.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Builder(
                    builder: (context) {
                      if (widget!.mediaPathImage != null &&
                          widget!.mediaPathImage != '') {
                        return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: FlutterFlowMediaDisplay(
                            path: widget!.mediaPathImage!,
                            imageBuilder: (path) => ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                path,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                            videoPlayerBuilder: (path) =>
                                FlutterFlowVideoPlayer(
                              path: path,
                              width: 300.0,
                              autoPlay: false,
                              looping: true,
                              showControls: true,
                              allowFullScreen: true,
                              allowPlaybackSpeedMenu: false,
                            ),
                          ),
                        );
                      } else if (widget!.mediaPathVideo != null &&
                          widget!.mediaPathVideo != '') {
                        return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: FlutterFlowMediaDisplay(
                            path: widget!.mediaPathVideo!,
                            imageBuilder: (path) => ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                path,
                                fit: BoxFit.contain,
                              ),
                            ),
                            videoPlayerBuilder: (path) =>
                                FlutterFlowVideoPlayer(
                              path: path,
                              width: 450.0,
                              height: 600.0,
                              autoPlay: true,
                              looping: true,
                              showControls: true,
                              allowFullScreen: true,
                              allowPlaybackSpeedMenu: false,
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'השחקן לא העלה קבצי מדיה למשימה הזו',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
