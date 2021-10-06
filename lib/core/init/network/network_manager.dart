import 'dart:io';

import 'package:dio/dio.dart';

import '../../base/model/base_model.dart';
import '../../constants/enums/preferences_keys_enum.dart';
import '../cache/locale_manager.dart';

class NetworkManager {
  static late NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;
  late Dio _dio;
  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      headers: {
        "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
      },
    );

    _dio = Dio(baseOptions);

    // _dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options) {
    //     options.path += "veli";
    //   },
    //   onResponse: (e) {
    //     return e.data;
    //   },
    //   onError: (e) {
    //     return BaseError(e.message);
    //   },
    // ));
  }

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;

        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map<String, Object>) {
          return model.fromJson(responseBody);
        }
        return responseBody;

      default:
    }
  }
}
