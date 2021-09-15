import 'dart:async';
import 'dart:convert';

import 'package:frontend_movie_store/model/managers/RestManager.dart';
import 'package:frontend_movie_store/model/objects/AuthenticationData.dart';
import 'package:frontend_movie_store/model/objects/Movie.dart';
import 'package:frontend_movie_store/model/objects/MoviePurchase.dart';
import 'package:frontend_movie_store/model/support/Constants.dart';
import 'package:frontend_movie_store/model/support/LogInResult.dart';

class Model{
  static Model sharedInstance=Model();

  RestManager _restManager=RestManager();
  AuthenticationData _authenticationData;

  Future<LogInResult> logIn(String email, String password) async {
    try{
      Map<String, String> params = Map();
      params["grant_type"] = "password";
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["username"] = email;
      params["password"] = password;
      String result = await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.REQUEST_LOGIN, params, type: TypeHeader.urlencoded);
      _authenticationData = AuthenticationData.fromJson(jsonDecode(result));
      if ( _authenticationData.hasError() ) {
        if ( _authenticationData.error == "Invalid user credentials" ) {
          return LogInResult.error_wrong_credentials;
        }
        else if ( _authenticationData.error == "Account is not fully set up" ) {
          return LogInResult.error_not_fully_setupped;
        }
        else {
          return LogInResult.error_unknown;
        }
      }
      _restManager.token = _authenticationData.accessToken;
      Timer.periodic(Duration(seconds: (_authenticationData.expiresIn - 50)), (Timer t) {
        _refreshToken();
      });
      return LogInResult.logged;
    }
    catch (e) {
      print("logIn"+ e);
      return LogInResult.error_unknown;
    }
  }

  Future<bool> _refreshToken() async {
    try {
      Map<String, String> params = Map();
      params["grant_type"] = "refresh_token";
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["refresh_token"] = _authenticationData.refreshToken;
      String result = await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.REQUEST_LOGIN, params, type: TypeHeader.urlencoded);
      _authenticationData = AuthenticationData.fromJson(jsonDecode(result));
      if ( _authenticationData.hasError() ) {
        return false;
      }
      _restManager.token = _authenticationData.accessToken;
      return true;
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> logOut() async {
    try{
      Map<String, String> params = Map();
      _restManager.token = null;
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["refresh_token"] = _authenticationData.refreshToken;
      await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.REQUEST_LOGOUT, params, type: TypeHeader.urlencoded);
      return true;
    }
    catch (e) {
      return false;
    }
  }

  Future<List<Movie>> searchProductByTitle(String title, int pageNumber, int pageSize, String sortedBy) async{
    Map<String, String> params=Map();
    params["title"]=title;
    params["pageNumber"]="$pageNumber";
    params["pageSize"]="$pageSize";
    params["sortedBy"]=sortedBy;
    try{
      return List<Movie>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_MOVIE_BYNAME, params)).map((i) => Movie.fromJson(i)).toList());
    }
    catch(e){
      return null;
    }
  }

  Future<String> doPurchase(List<MoviePurchase> order) async{
    try {
      Map<String, String> params = Map();
      String result=await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_DO_PURCHASE, order);
      print(result);
      if(result.contains("Quantity issue")) return "The requested quantity is not available";
      else if(result.contains("Authentication issue")) return "You must be logged in to complete a purchase";
      else return "Ok";
    }
    catch (e) {
      return "";
    }
  }



}