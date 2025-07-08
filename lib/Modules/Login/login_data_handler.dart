
import 'package:dartz/dartz.dart';
import 'package:fast_http/core/API/generic_request.dart';
import 'package:fast_http/core/API/request_method.dart';
import 'package:fast_http/core/Error/exceptions.dart';
import 'package:fast_http/core/Error/failures.dart';

import '../../Models/user_model.dart';
import '../../Utilities/api_end_point.dart';

class LoginDataHandler {
  static Future<Either<Failure,UserModel>> getCurrentUser()async{
    try {
      UserModel response = await GenericRequest<UserModel>(
        method: RequestApi.post(
            url: APIEndPoint.login,
            headers: {
              "content-type": "application/json"
            },
            body: {
              "email": "testrassul3@mof.gov.kw",
              "password": "M0f@74594021T32"
            }

        ),
        fromMap: (data)=> UserModel.fromJson(data),
      ).getResponse();

      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }
}