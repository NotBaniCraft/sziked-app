import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginService {
  static final supabase = Supabase.instance.client;
  
  // Main login function
  static Future<void> loginWithCredentials({
    required String email,
    required String password,
  }) async {
    try {
      // Sign in with email and password
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      
      if (response.user == null) {
        throw 'Login failed - no user returned';
      }
      
      debugPrint('Login successful for ${response.user!.email}!');
      
    } catch (error) {
      debugPrint('Login error: $error');
      rethrow;
    }
  }
  
  // Logout function
  static Future<void> logout() async {
    try {
      await supabase.auth.signOut();
      debugPrint('User logged out successfully');
      
      // TODO: Navigate to login screen here
      
    } catch (error) {
      debugPrint('Logout error: $error');
      rethrow;
    }
  }
  
  // Check if user is currently logged in
  static bool isLoggedIn() {
    return supabase.auth.currentUser != null;
  }
  
  // Get current user info
  static User? getCurrentUser() {
    return supabase.auth.currentUser;
  }
  
  // Get user profile from database
  static Future<Map<String, dynamic>?> getUserProfile() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return null;
      
      final profile = await supabase
          .from('user_profiles')
          .select('*')
          .eq('id', user.id)
          .maybeSingle();
    

      return profile;
    } catch (error) {
      debugPrint('Error getting user profile: $error');
      return null;
    }
  }
  
  // Check if user has completed registration (has profile)
  static Future<bool> hasUserProfile() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return false;
      
      final profile = await supabase
          .from('user_profiles')
          .select('id')
          .eq('id', user.id)
          .maybeSingle();
      
      return profile != null;
    } catch (error) {
      debugPrint('Error checking user profile: $error');
      return false;
    }
  }
}