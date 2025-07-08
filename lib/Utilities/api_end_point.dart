
import '../Models/server_model.dart';

class APIEndPoint{
  static final ServerModel _apiServer = ServerModel(serverIsSecured: true, host: "mofetenderingbe-v2-edhjbhhkdkevemb0.uaenorth-01.azurewebsites.net", apiPrefix: "",);
  static String get _baseURL => '${_apiServer.baseUrl}/';



  //=========================== api User ====================================
  static String get login => "${_baseURL}Auth/Login";
}



