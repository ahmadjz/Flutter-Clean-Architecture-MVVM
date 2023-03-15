import 'package:api_mvvm/data/network/failure.dart';
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioErrorType.cancel:
      return DataSource.cancel.getFailure();
    case DioErrorType.other:
      return DataSource.defaultError.getFailure();
    case DioErrorType.response:
      return DataSource.defaultError.getFailure();
  }
}

enum DataSource {
  defaultError,
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorized,
  notFound,
  internetServerError,
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(
          code: ResponseCode.success,
          message: ResponseMessage.success,
        );
      case DataSource.noContent:
        return Failure(
          code: ResponseCode.noContent,
          message: ResponseMessage.noContent,
        );

      case DataSource.badRequest:
        return Failure(
          code: ResponseCode.badRequest,
          message: ResponseMessage.badRequest,
        );

      case DataSource.forbidden:
        return Failure(
          code: ResponseCode.forbidden,
          message: ResponseMessage.forbidden,
        );

      case DataSource.unAuthorized:
        return Failure(
          code: ResponseCode.unAuthorized,
          message: ResponseMessage.unAuthorized,
        );

      case DataSource.notFound:
        return Failure(
          code: ResponseCode.notFound,
          message: ResponseMessage.notFound,
        );

      case DataSource.internetServerError:
        return Failure(
          code: ResponseCode.internetServerError,
          message: ResponseMessage.internetServerError,
        );

      case DataSource.connectTimeOut:
        return Failure(
          code: ResponseCode.connectTimeOut,
          message: ResponseMessage.connectTimeOut,
        );

      case DataSource.cancel:
        return Failure(
          code: ResponseCode.cancel,
          message: ResponseMessage.cancel,
        );

      case DataSource.receiveTimeOut:
        return Failure(
          code: ResponseCode.receiveTimeOut,
          message: ResponseMessage.receiveTimeOut,
        );

      case DataSource.sendTimeOut:
        return Failure(
          code: ResponseCode.sendTimeOut,
          message: ResponseMessage.sendTimeOut,
        );

      case DataSource.cacheError:
        return Failure(
          code: ResponseCode.cacheError,
          message: ResponseMessage.cacheError,
        );

      case DataSource.noInternetConnection:
        return Failure(
          code: ResponseCode.noInternetConnection,
          message: ResponseMessage.noInternetConnection,
        );
      case DataSource.defaultError:
        return Failure(
          code: ResponseCode.defaultError,
          message: ResponseMessage.defaultError,
        );
    }
  }
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unAuthorized = 401;
  static const int notFound = 404;
  static const int internetServerError = 500;

  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -6;
}

class ResponseMessage {
  static const String success = "success";
  static const String noContent = "success";
  static const String badRequest = "Bad request, Try again later";
  static const String forbidden = "Forbidden request, Try again later";
  static const String unAuthorized = "User is unauthorized, Try again later";
  static const String notFound = "Some thing went wrong, Try again later";
  static const String internetServerError =
      "Some thing went wrong, Try again later";

  static const String connectTimeOut = "Time out error, Try again later";
  static const String cancel = "Request was cancelled, Try again later";
  static const String receiveTimeOut = "Time out error, Try again later";
  static const String sendTimeOut = "Time out error, Try again later";
  static const String cacheError = "Cache error, Try again later";
  static const String noInternetConnection =
      "Please check your internet connection";
  static const String defaultError = "Some thing went wrong, Try again later";
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
