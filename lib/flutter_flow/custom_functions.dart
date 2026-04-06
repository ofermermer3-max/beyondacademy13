import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime addMinutesToDate(
  int timeToAdd,
  DateTime startDate,
) {
  DateTime futureTime = startDate.add(
    Duration(minutes: timeToAdd),
  );

  return futureTime;
}

/// recives an birthday date and returns the age
int returnAge(DateTime birthDate) {
  final DateTime today = DateTime.now();

  int age = today.year - birthDate.year;

  // אם עוד לא עבר יום ההולדת השנה – מורידים שנה
  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }

  return age;
}

bool isVideoPath(String? url) {
  if (url == null) return false;

  final lower = url.toLowerCase();

  return lower.contains('.mp4') ||
      lower.contains('.mov') ||
      lower.contains('.m4v') ||
      lower.contains('.webm');
}
