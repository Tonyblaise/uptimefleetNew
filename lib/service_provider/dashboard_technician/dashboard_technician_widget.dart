import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/chat/service_summary_widget/service_summary_widget_widget.dart';
import '/components/tech_status_component_widget.dart';
import '/components/user_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/service_provider/bottom_bar/bottom_bar_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dashboard_technician_model.dart';
export 'dashboard_technician_model.dart';

class DashboardTechnicianWidget extends StatefulWidget {
  const DashboardTechnicianWidget({super.key});

  @override
  State<DashboardTechnicianWidget> createState() =>
      _DashboardTechnicianWidgetState();
}

class _DashboardTechnicianWidgetState extends State<DashboardTechnicianWidget> {
  late DashboardTechnicianModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardTechnicianModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      if (currentUserLocationValue != null) {
        _model.instantTimer = InstantTimer.periodic(
          duration: const Duration(milliseconds: 60000),
          callback: (timer) async {
            currentUserLocationValue =
                await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
            _model.apiResultayo6 = await UptimeFleetAppGroup
                .updateTechnicianPositionUsingCurrentPostionCall
                .call(
              technicianId:
                  valueOrDefault(currentUserDocument?.technicianId, ''),
              position: currentUserLocationValue?.toString(),
            );

            await currentUserReference!.update(createUsersRecordData(
              technicianLastUpdatedLocation: currentUserLocationValue,
            ));
            await actions.mainAction(
              (lat, lng) async {},
            );
          },
          startImmediately: true,
        );
      } else {
        await requestPermission(locationPermission);
        _model.instantTimer2 = InstantTimer.periodic(
          duration: const Duration(milliseconds: 60000),
          callback: (timer) async {
            currentUserLocationValue =
                await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
            _model.apiResultayoo = await UptimeFleetAppGroup
                .updateTechnicianPositionUsingCurrentPostionCall
                .call(
              technicianId:
                  valueOrDefault(currentUserDocument?.technicianId, ''),
              position: currentUserLocationValue?.toString(),
            );

            await currentUserReference!.update(createUsersRecordData(
              technicianLastUpdatedLocation: currentUserLocationValue,
            ));
            await actions.mainAction(
              (lat, lng) async {},
            );
          },
          startImmediately: true,
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Text(
                'Dashboard',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Yantramanav',
                      color: const Color(0xFF1E293B),
                      fontSize: 30.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        decoration: const BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model.userDetailsModel,
                                          updateCallback: () => setState(() {}),
                                          child: const UserDetailsWidget(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 15.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          if (currentUserDocument
                                                  ?.activeRequest ==
                                              null) {
                                            return Container(
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: const SizedBox(
                                                                height: 300.0,
                                                                child:
                                                                    TechStatusComponentWidget(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      height: 56.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(60.0),
                                                        border: Border.all(
                                                          color:
                                                              const Color(0xFFE5E7EE),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.onDuty,
                                                                      false)
                                                                  ? 'On Duty'
                                                                  : 'Off Duty',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Yantramanav',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Container(
                                                              width: 32.0,
                                                              height: 32.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: valueOrDefault<
                                                                            bool>(
                                                                        currentUserDocument
                                                                            ?.onDuty,
                                                                        false)
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            if (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.activeVehicle,
                                                                        '') !=
                                                                    '') {
                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.9,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: const Color(
                                                                        0xFFCBD5E1),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'Active Vehicle',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Yantramanav',
                                                                                      fontSize: 24.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Icon(
                                                                                Icons.switch_right_rounded,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(18.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              10.0,
                                                                              20.0,
                                                                              10.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: double.infinity,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Vehicle License Number',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Yantramanav',
                                                                                            color: Colors.black,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      'Add an image of the service',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Yantramanav',
                                                                                            color: const Color(0xFF64748B),
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: double.infinity,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Vehicle Information',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Yantramanav',
                                                                                            color: Colors.black,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      'Add an image of the service',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Yantramanav',
                                                                                            color: const Color(0xFF64748B),
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(const SizedBox(height: 10.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                              );
                                                            } else {
                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.9,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: const Color(
                                                                        0xFFCBD5E1),
                                                                  ),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  height: 200.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .emptyStateSimpleModel,
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    child:
                                                                        EmptyStateSimpleWidget(
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .search_off,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            35.0,
                                                                      ),
                                                                      title:
                                                                          'No active vehicle selected',
                                                                      body:
                                                                          'Click here to update active vehicle',
                                                                      action:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 16.0)),
                                                    ),
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 16.0)),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              width: 100.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.99,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    FutureBuilder<
                                                        ApiCallResponse>(
                                                  future: UptimeFleetAppGroup
                                                      .getRequestCall
                                                      .call(
                                                    request: valueOrDefault(
                                                        currentUserDocument
                                                            ?.activeRequestBubble,
                                                        ''),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final containerGetRequestResponse =
                                                        snapshot.data!;
                                                    return Container(
                                                      constraints:
                                                          const BoxConstraints(
                                                        minHeight:
                                                            double.infinity,
                                                      ),
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .serviceSummaryWidgetModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            ServiceSummaryWidgetWidget(
                                                          fleetCompanyName:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .driverCompanyName(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          ),
                                                          driverName:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .driverFullName(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          ),
                                                          driverPhoneNumber:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .driverPhoneNumber(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          ),
                                                          serviceId:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .serviceId(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          ),
                                                          timestamp:
                                                              dateTimeFormat(
                                                            'd/M h:mm a',
                                                            functions.converUnixTimestamp(
                                                                UptimeFleetAppGroup
                                                                    .getRequestCall
                                                                    .timestamp(
                                                              containerGetRequestResponse
                                                                  .jsonBody,
                                                            )!),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          eventType:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .fault(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          ),
                                                          pickUp:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .location(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          ),
                                                          dropOff:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .dropOffLocation(
                                                                    containerGetRequestResponse
                                                                        .jsonBody,
                                                                  )
                                                                  .toString(),
                                                          vehicleLicenseNumber:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .vehicleRegNo(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          ),
                                                          vehicleInformation:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .vehicleColor(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          ),
                                                          vehicleVinNumber:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .vehicleVinNumber(
                                                                    containerGetRequestResponse
                                                                        .jsonBody,
                                                                  )
                                                                  .toString(),
                                                          locationLat: functions
                                                              .convertStringToDouble(
                                                                  UptimeFleetAppGroup
                                                                      .getRequestCall
                                                                      .lat(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          ))!,
                                                          locationLng: functions
                                                              .convertStringToDouble(
                                                                  UptimeFleetAppGroup
                                                                      .getRequestCall
                                                                      .lng(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          ))!,
                                                          firebaseId: functions
                                                              .convertStringToRequestDocRef(
                                                                  UptimeFleetAppGroup
                                                                      .getRequestCall
                                                                      .firebaseId(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          ))!,
                                                          status:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .status(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          )!,
                                                          driverTechMessageId:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .driverTechnicianMessageThreadId(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          )!,
                                                          bubbleId:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .uniqueId(
                                                            containerGetRequestResponse
                                                                .jsonBody,
                                                          )!,
                                                          driverImage:
                                                              UptimeFleetAppGroup
                                                                  .getRequestCall
                                                                  .driverImage(
                                                                    containerGetRequestResponse
                                                                        .jsonBody,
                                                                  )
                                                                  .toString(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                            ),
                          ].divide(const SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.bottomBarModel,
                  updateCallback: () => setState(() {}),
                  child: const BottomBarWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
