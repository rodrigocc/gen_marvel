import 'package:flutter/material.dart';

abstract class ILocalClient {
  Future<String> getAsset(String path, BuildContext context);
}

class LocalCLientServiceImpl implements ILocalClient {
  @override
  Future<String> getAsset(String path, BuildContext context) async {
    final response = await DefaultAssetBundle.of(context).loadString(path);
    return response;
  }
}
