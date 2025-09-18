import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegistrationService {
  static final supabase = Supabase.instance.client;
  
  // Main registration function
  static Future<void> registerWithCustomId({
    required String email,
    required String password, 
    required String customId,
  }) async {
    try {
      // 1. Check if custom_id exists in pending_profiles
      final pendingProfile = await supabase
          .from('pending_profiles')
          .select('*')
          .eq('custom_id', customId)
          .eq('status', 'pending')
          .maybeSingle();
      
      if (pendingProfile == null) {
        throw 'Invalid ID or already registered!';
      }
      
      // 2. Create Supabase auth account
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      
      if (response.user == null) {
        throw 'Failed to create account';
      }
      
      // 3. Create user_profile using pending data
      await supabase.from('user_profiles').insert({
        'id': response.user!.id,
        'custom_id': pendingProfile['custom_id'],
        'full_name': pendingProfile['full_name'],
        'custom_name': pendingProfile['custom_name'],
        'email': email,
        'role': pendingProfile['role'],
        'pending_profile_id': pendingProfile['id'],
      });
      
      // 4. Mark pending profile as registered
      await supabase.from('pending_profiles')
          .update({'status': 'registered'})
          .eq('id', pendingProfile['id']);
      
      debugPrint('Registration successful for ${pendingProfile['custom_name']}!');

      
    } catch (error) {
      debugPrint('Registration error: $error');
      rethrow;
    }
  }
  
  // Check if custom_id is available for registration
  static Future<Map<String, dynamic>?> checkCustomId(String customId) async {
    try {
      final pendingProfile = await supabase
          .from('pending_profiles')
          .select('custom_id, full_name, custom_name, role')
          .eq('custom_id', customId)
          .eq('status', 'pending')
          .maybeSingle();
      
      return pendingProfile;
    } catch (error) {
      debugPrint('Error checking custom ID: $error');
      return null;
    }
  }
}