import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

var locator = GetIt.instance;

T getSingleton<T extends Object>() {
  return locator.get<T>();
}

T getProvider<T extends Object>(BuildContext context, {bool listen = true}) {
  return Provider.of<T>(context, listen: listen);
}