import 'package:flutter/material.dart';

// --- Main Application Widget ---
void main() {
  runApp(const GPSSystemApp());
}

class GPSSystemApp extends StatelessWidget {
  const GPSSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPS System Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

// --- Login Screen Widget ---
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the size of the screen
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // The background is a gradient blue
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF81D4FA), // Light Blue
              Color(0xFF1E88E5), // Medium Blue
              Color(0xFF0D47A1), // Dark Blue
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        // The main content is centered
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: _buildLoginCard(context),
          ),
        ),
      ),
    );
  }

  // --- Login Card Builder ---
  Widget _buildLoginCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        // Glassmorphism effect: transparent background with blur
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      // To achieve the blur effect, you would need the 'dart:ui' import
      // and a BackdropFilter, but for a simple non-dependency example,
      // a semi-transparent color will be used, mimicking the look.
      child: Column(
        mainAxisSize: MainMinAxisSize.min,
        children: <Widget>[
          // 1. School Bus Icon
          // NOTE: I'm using a placeholder icon as the exact custom image
          // is not available in standard Flutter widgets.
          Image.asset(
            'assets/school_bus_icon.png', // Replace with your actual asset path
            height: 100,
            width: 100,
            errorBuilder: (context, error, stackTrace) {
              // Fallback if asset is missing (using a material icon)
              return const Icon(
                Icons.bus_alert,
                size: 80,
                color: Color(0xFFFFC107), // A yellow color
              );
            },
          ),
          const SizedBox(height: 20),

          // 2. GPS System Title
          const Text(
            'GPS System',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87, // Slightly dark text for contrast
            ),
          ),
          const SizedBox(height: 30),

          // 3. Username Field
          _buildTextField(
            hintText: 'Username',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 20),

          // 4. Password Field
          _buildTextField(
            hintText: 'Password',
            icon: Icons.lock_outline,
            isPassword: true,
          ),
          const SizedBox(height: 30),

          // 5. LOGIN Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Add login logic
                debugPrint('Login button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D47A1), // Dark Blue for button
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),

          // 6. Forgot Password? and Sign Up links
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  // TODO: Add Forgot Password navigation
                  debugPrint('Forgot Password pressed');
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF0D47A1), // Dark Blue link
                    fontSize: 14,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Add Sign Up navigation
                  debugPrint('Sign Up pressed');
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xFF0D47A1), // Dark Blue link
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Custom TextField Builder ---
  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // White background for the input field
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: Icon(icon, color: Colors.grey.shade600),
          border: InputBorder.none, // Removes the default border
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
      ),
    );
  }
}
