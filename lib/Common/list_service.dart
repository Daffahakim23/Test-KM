// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:suitmedia/Common/list_response.dart';
import 'api_url.dart';

class WatchService {
  Future<ListResponse> getList() async {
    try {
      final response = await Dio().get(url);

      return ListResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed Get Watch $e');
    }
  }
}