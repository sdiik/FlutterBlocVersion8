import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// colors
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const lineColor = Color(0xFFD9D9D9);

// base url
const stagingURL = "https://hhstaging.hungryhub.com";
const productionURL = "https://www.hungryhub.com/api/v5";

// header
const contentType = "application/json";
const minorVersion = 3;

var dio = Dio();

var options = Options(
  contentType: "application/json",
  followRedirects: false,
);
