import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:test_app/core/failure_model.dart';
import 'package:test_app/core/network/network_api_calls.dart';
import '../constant.dart';
import 'api_response_model.dart';

class NetworkApiCallsImpl extends GetConnect implements NetworkApiCalls {
  NetworkApiCallsImpl() : super(allowAutoSignedCert: true);
  late String apiUrl = "";
  late Response response;

  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 33);
    super.onInit();
  }

  @override
  Future<Either<FailureModel, dynamic>> getRequestWithAuth(
      String endpoint, String authToken, bool isCalling,
      {Map<String, dynamic>? queryParams}) async {
    try {
      apiUrl = BaseUrl + endpoint;
      response = await get(apiUrl,
          headers: {
            'Accept': 'application/json',
            'x-access-token': authToken,
          },
          query: queryParams);

      print("endpoint :: ${BaseUrl + endpoint}");
      if (response.statusCode == 401 &&
          (ApiResponseModel.fromJson(response.body).message ==
                  "User deactivated!" ||
              response.body["message"] == "User deactivated!")) {}
      return isCalling
          ? Right(ApiResponseModel.fromJson(response.body))
          : Right(response.body);
    } catch (error, stackTrace) {
      return _response(response);
    }
  }

  @override
  Future<Either<FailureModel, dynamic>> getRequestWithoutAuth(
      String endpoint) async {
    try {
      apiUrl = BaseUrl + endpoint;
      print("Url :: ${BaseUrl + endpoint}");
      response = await get(apiUrl);
      if (response.statusCode == 401) {}
      return Right(response.body);
    } catch (error, stackTrace) {
      return Left(_response(response));
    }
  }

  dynamic _response(Response response) {
    throw FailureModel(errorMessage: SERVER_EXCEPTION, statusCode: null);
  }
}
