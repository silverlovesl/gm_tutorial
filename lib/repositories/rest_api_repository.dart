import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:gm_tutorial/models/app_error.dart';
import 'package:gm_tutorial/repositories/repository.dart';
import 'package:gm_tutorial/settings/settings.dart';

abstract class RestApiRepositoryBase extends GetConnect implements Repository {
  final Settings settings;
  RestApiRepositoryBase({required this.settings});

  @override
  void onInit() {
    // Get env variable
    const flavor = String.fromEnvironment('FLAVOR');

    // Set connect common timout setting
    timeout = const Duration(seconds: 30);
    // Set base url
    if (flavor == 'local') {
      httpClient.baseUrl = "http://localhost:5000/api";
    } else if (flavor == "dev") {
      httpClient.baseUrl = "http://dev.gm/api";
    } else if (flavor == "prod") {
      httpClient.baseUrl = "http://prod.gm/api";
    }

    httpClient.userAgent = Platform.isIOS ? 'gm-ios' : 'gm-android';
    httpClient.sendUserAgent = true;
    httpClient.addRequestModifier<Object?>((request) async {
      //final token = settings.getAuthToken();
      request.headers['Authorization'] = 'Bearer XXXXXXXXX';
      return request;
    });

    super.onInit();
  }

  final httpContentTypeJSON = {
    "Content-Type": "application/json",
  };

  Future<T> getRequest<T>(String url, {Map<String, dynamic>? query, Decoder<T>? decoder}) async {
    final response = await get(url, query: query);
    if (decoder != null) {
      return _handleResponse(response, decoder: decoder);
    } else {
      return handleResponseVoid(response);
    }
  }

  Future<T> postRequest<T>(String url, Map<String, dynamic> requestBody, {Decoder<T>? decoder}) async {
    final Response<T> response = await post(url, jsonEncode(requestBody), headers: httpContentTypeJSON);
    if (decoder != null) {
      return _handleResponse(response, decoder: decoder);
    } else {
      return handleResponseVoid(response);
    }
  }

  Future<T> putRequest<T>(String url, Map<String, dynamic> requestBody, {Decoder<T>? decoder}) async {
    final Response<T> response = await put(url, jsonEncode(requestBody), headers: httpContentTypeJSON);
    if (decoder != null) {
      return _handleResponse(response, decoder: decoder);
    } else {
      return handleResponseVoid(response);
    }
  }

  Future<T> deleteRequest<T>(String url, {Map<String, dynamic>? query, Decoder<T>? decoder}) async {
    final response = await delete(url, query: query);
    if (decoder != null) {
      return _handleResponse(response, decoder: decoder);
    } else {
      return handleResponseVoid(response);
    }
  }

  T _handleResponse<T>(Response<dynamic> response, {required Decoder decoder}) {
    final body = response.body;
    debugPrint(response.request?.url.toString() ?? '');
    if (response.isOk) {
      return decoder(body);
    } else {
      handleErrorResponse(response);
    }
  }

  handleResponseVoid(Response<dynamic> response) {}

  Never handleErrorResponse(Response<dynamic> response) {
    AppError appError;
    final statusCode = response.statusCode ?? 0;
    if (statusCode >= HttpStatus.badRequest && statusCode < HttpStatus.internalServerError) {
      // Error handling
      appError = AppError.fromJson(response.body);

      // Get forbidden error
      if (statusCode == HttpStatus.forbidden) {
        // Handle
      }
    } else {
      // Handle Other Error
      appError = AppError(statusCode: statusCode, errorCode: statusCode);
    }
    appError = appError.copyWith(statusCode: statusCode);
    throw appError;
  }
}

/// RestApiRepository
/// Reference: https://pub.dev/packages/get#default-configuration
class RestApiRepository extends RestApiRepositoryBase {
  RestApiRepository({required super.settings});

  @override
  void onInit() {
    // Something here
    super.onInit();
  }
}
