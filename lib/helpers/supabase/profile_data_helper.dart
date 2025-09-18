import 'package:sziked/helpers/supabase/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDataHelper {
  static String? _cachedName;
  static const _cacheDuration = Duration(hours: 1);

  // original: always fetch fresh from supabase
  static Future<String> getCustomName() async {
    final profile = await LoginService.getUserProfile();
    if (profile == null) return 'user';

    final customName = profile['custom_name'] as String?;
    return customName ?? 'user';
  }

  // new: cached version with timestamp
  static Future<String> getCachedName() async {
    final prefs = await SharedPreferences.getInstance();

    // check in-memory cache first
    if (_cachedName != null) return _cachedName!;

    // read cached name & timestamp from persistent storage
    final storedName = prefs.getString('custom_name');
    final storedTimestamp = prefs.getInt('custom_name_timestamp') ?? 0;

    final now = DateTime.now().millisecondsSinceEpoch;

    if (storedName != null && (now - storedTimestamp) < _cacheDuration.inMilliseconds) {
      // cache is still valid
      _cachedName = storedName;
      return _cachedName!;
    }

    // cache is missing or expired → fetch fresh from supabase
    final profile = await LoginService.getUserProfile();
    final customName = profile?['custom_name'] as String? ?? 'user';

    // save to in-memory cache and persistent storage
    _cachedName = customName;
    await prefs.setString('custom_name', customName);
    await prefs.setInt('custom_name_timestamp', now);

    return _cachedName!;
  }
}
