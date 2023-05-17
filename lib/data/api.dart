import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:github_api/models/github_response_model.dart';
import 'dart:developer' as developer;

Api api = Api();

class Api {
  Dio _getDio() {
    return Dio(BaseOptions(
      baseUrl: 'https://api.github.com',
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
      headers: {'Content-Type': 'application/json'},
    ));
  }

  Future<GithubResponseModel?> fetchRepos(Map<String, dynamic> params) async{
    Response? _response;
    try {
      Dio dio = _getDio();
      dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: 'https://api.github.com')).interceptor);
      _response = await dio.get('/search/repositories', queryParameters: params, options: buildCacheOptions(
        const Duration(minutes: 30), //duration of cache
        forceRefresh: false, //to force refresh
        maxStale: const Duration(days: 10), //before this time, if error like
        //500, 500 happens, it will return cache
      ));
      // developer.log(_response.data.toString());
    } on DioError catch (e) {
      developer.log(e.toString());
    }
    if (_response != null) {
      return GithubResponseModel.fromJson(_response.data);
    }
    return null;
  }


}
