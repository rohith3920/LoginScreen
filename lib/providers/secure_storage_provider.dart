

// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleektask/providers/logger.dart';


class SecureStorageProvider {
  // Commenting Flutter Secure Storage up until a bug is fixed
  // where the app throws PlatformException on few devices.

  // final _storage = const FlutterSecureStorage();
  // IOSOptions _getIOSOptions() => const IOSOptions(
  //       accessibility: IOSAccessibility.first_unlock,
  //     );
  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //       encryptedSharedPreferences: true,
  //     );

  SharedPreferences? _sharedPrefs;

  Future<void> loadPreferences() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  Future<void> add({required String key, String? value}) async {
    logger("WROTE KEY: $key, VALUE: $value");
    // await _storage.write(
    //   key: key,
    //   value: value,
    //   iOptions: _getIOSOptions(),
    //   aOptions: _getAndroidOptions(),
    // );
    await _sharedPrefs?.setString(key, value.toString());
  }

  Future<String?> read({required String key}) async {
    // String? value = await _storage.read(
    //   key: key,
    //   iOptions: _getIOSOptions(),
    //   aOptions: _getAndroidOptions(),
    // );

    final value = _sharedPrefs?.get(key)?.toString();
    logger("READ KEY: $key, VALUE: $value");
    if (value?.isEmpty ?? false) {
      return null;
    }
    return value;
  }

  Future<void> saveIPAddressToDisk(String ipAddress) async {
    await add(key: 'ipAddress', value: ipAddress);
  }

  Future<String> getIPAddressFromDisk() async {
    String? response = await read(key: "ipAddress");
    return response ?? "";
  }

  // Future<void> saveUserToDisk(AccessTokenModel userData) async {
  //   await add(key: 'isLoggedIn', value: 'true');
  //   await add(key: 'userDetails', value: json.encode(userData));
  // }

  // Future<void> saveUserDetailsToDisk(UserDetailsModel? userDetails) async {
  //   await add(key: 'userDetailsData', value: json.encode(userDetails));
  // }

  // Future<UserDetailsModel> getUserDetailsFromDisk() async {
  //   String? response = await read(key: 'userDetailsData');
  //   if (response != null) {
  //     return UserDetailsModel.fromJson(json.decode(response));
  //   }
  //   throw AuthenticationException(
  //     message: 'User not found',
  //   );
  // }

  // Future<AccessTokenModel> getUserFromDisk() async {
  //   String? response = await read(key: 'userDetails');
  //   if (response != null) {
  //     return AccessTokenModel.fromJson(json.decode(response));
  //   }
  //   throw AuthenticationException(
  //     message: 'User not found',
  //   );
  // }

  Future<void> remove({required String key}) async {
    // await _storage.delete(
    //   key: key,
    //   iOptions: _getIOSOptions(),
    //   aOptions: _getAndroidOptions(),
    // );
    await _sharedPrefs?.remove(key);
  }

  Future<void> removeUser() async {
    await add(key: 'isLoggedIn', value: 'false');
    await remove(key: 'userDetails');
  }

  Future<void> removeUserDetails() async {
    await remove(key: 'userDetailsData');
  }

  Future<void> logout() async {
    await remove(key: 'userDetails');
    await add(key: 'isTutorialShown', value: 'true');
    await add(key: 'isLoggedIn', value: 'false');
    await add(key: 'isFirstTime', value: 'false');
  }

  Future<void> removeAllKeys() async {
    // await _storage.deleteAll(
    //   iOptions: _getIOSOptions(),
    //   aOptions: _getAndroidOptions(),
    // );
    await _sharedPrefs?.clear();
  }
}
