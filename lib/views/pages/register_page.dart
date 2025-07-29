import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage
    extends
        StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(
         key:
             key,
       );

  @override
  State<
    RegisterPage
  >
  createState() =>
      _RegisterPageState();
}

class _RegisterPageState
    extends
        State<
          RegisterPage
        > {
  final _formKey =
      GlobalKey<
        FormState
      >();
  final _firstNameController =
      TextEditingController();
  final _phoneController =
      TextEditingController();
  final _zipController =
      TextEditingController();
  final _emailController =
      TextEditingController();
  final _passwordController =
      TextEditingController();
  bool _isPasswordVisible =
      false;
  bool _isLoading =
      false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _phoneController.dispose();
    _zipController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final screenWidth =
        MediaQuery.of(
          context,
        ).size.width;
    final isTablet =
        screenWidth >
        600;
    final isDesktop =
        screenWidth >
        1200;

    return Scaffold(
      backgroundColor: const Color(
        0xFF0A0A0F,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width:
                double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin:
                    Alignment.topLeft,
                end:
                    Alignment.bottomRight,
                colors: [
                  const Color(
                    0xFF0A0A0F,
                  ),
                  const Color(
                    0xFF1A0D2E,
                  ),
                  const Color(
                    0xFF2D1B4E,
                  ),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    isDesktop
                        ? 40
                        : (isTablet
                            ? 30
                            : 20),
                vertical:
                    20,
              ),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth:
                        isDesktop
                            ? 500
                            : (isTablet
                                ? 450
                                : double.infinity),
                  ),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height:
                            40,
                      ),

                      // App Logo/Icon
                      Container(
                        width:
                            80,
                        height:
                            80,
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF6C5CE7,
                          ),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFF6C5CE7,
                              ).withOpacity(
                                0.3,
                              ),
                              blurRadius:
                                  20,
                              offset: const Offset(
                                0,
                                10,
                              ),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.health_and_safety_rounded,
                          size:
                              40,
                          color:
                              Colors.white,
                        ),
                      ),

                      const SizedBox(
                        height:
                            24,
                      ),

                      // Title
                      Text(
                        'Join Our Community',
                        style: TextStyle(
                          fontSize:
                              isTablet
                                  ? 32
                                  : 28,
                          fontWeight:
                              FontWeight.bold,
                          color:
                              Colors.white,
                          letterSpacing:
                              -0.5,
                        ),
                      ),

                      const SizedBox(
                        height:
                            8,
                      ),

                      // Subtitle
                      Text(
                        'Connect with others on your health journey',
                        style: TextStyle(
                          fontSize:
                              isTablet
                                  ? 18
                                  : 16,
                          color: Colors.white.withOpacity(
                            0.7,
                          ),
                        ),
                        textAlign:
                            TextAlign.center,
                      ),

                      const SizedBox(
                        height:
                            40,
                      ),

                      // Registration Form
                      Container(
                        padding: EdgeInsets.all(
                          isTablet
                              ? 32
                              : 24,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(
                            0.05,
                          ),
                          borderRadius: BorderRadius.circular(
                            24,
                          ),
                          border: Border.all(
                            color: Colors.white.withOpacity(
                              0.1,
                            ),
                            width:
                                1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                0.1,
                              ),
                              blurRadius:
                                  20,
                              offset: const Offset(
                                0,
                                10,
                              ),
                            ),
                          ],
                        ),
                        child: Form(
                          key:
                              _formKey,
                          child: Column(
                            children: [
                              // First Name Field
                              _buildInputField(
                                controller:
                                    _firstNameController,
                                label:
                                    'First Name',
                                hint:
                                    'Enter your first name',
                                icon:
                                    Icons.person_outline,
                                validator: (
                                  value,
                                ) {
                                  if (value ==
                                          null ||
                                      value.isEmpty) {
                                    return 'First name is required';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(
                                height:
                                    20,
                              ),

                              // Phone Number Field
                              _buildInputField(
                                controller:
                                    _phoneController,
                                label:
                                    'Phone Number',
                                hint:
                                    'Enter your phone number',
                                icon:
                                    Icons.phone_outlined,
                                keyboardType:
                                    TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (
                                  value,
                                ) {
                                  if (value ==
                                          null ||
                                      value.isEmpty) {
                                    return 'Phone number is required';
                                  }
                                  if (value.length <
                                      10) {
                                    return 'Please enter a valid phone number';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(
                                height:
                                    20,
                              ),

                              // ZIP Code Field
                              _buildInputField(
                                controller:
                                    _zipController,
                                label:
                                    'ZIP Code',
                                hint:
                                    'Enter your ZIP code',
                                icon:
                                    Icons.location_on_outlined,
                                keyboardType:
                                    TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(
                                    6,
                                  ),
                                ],
                                validator: (
                                  value,
                                ) {
                                  if (value ==
                                          null ||
                                      value.isEmpty) {
                                    return 'ZIP code is required';
                                  }
                                  if (value.length <
                                      5) {
                                    return 'Please enter a valid ZIP code';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(
                                height:
                                    20,
                              ),

                              // Email Field
                              _buildInputField(
                                controller:
                                    _emailController,
                                label:
                                    'Email',
                                hint:
                                    'Enter your email address',
                                icon:
                                    Icons.email_outlined,
                                keyboardType:
                                    TextInputType.emailAddress,
                                validator: (
                                  value,
                                ) {
                                  if (value ==
                                          null ||
                                      value.isEmpty) {
                                    return 'Email is required';
                                  }
                                  if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                  ).hasMatch(
                                    value,
                                  )) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(
                                height:
                                    20,
                              ),

                              // Password Field
                              _buildInputField(
                                controller:
                                    _passwordController,
                                label:
                                    'Password',
                                hint:
                                    'Create a strong password',
                                icon:
                                    Icons.lock_outline,
                                isPassword:
                                    true,
                                validator: (
                                  value,
                                ) {
                                  if (value ==
                                          null ||
                                      value.isEmpty) {
                                    return 'Password is required';
                                  }
                                  if (value.length <
                                      8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(
                                height:
                                    32,
                              ),

                              // Register Button
                              SizedBox(
                                width:
                                    double.infinity,
                                height:
                                    56,
                                child: ElevatedButton(
                                  onPressed:
                                      _isLoading
                                          ? null
                                          : _handleRegister,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(
                                      0xFF6C5CE7,
                                    ),
                                    foregroundColor:
                                        Colors.white,
                                    elevation:
                                        8,
                                    shadowColor: const Color(
                                      0xFF6C5CE7,
                                    ).withOpacity(
                                      0.4,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        16,
                                      ),
                                    ),
                                  ),
                                  child:
                                      _isLoading
                                          ? const SizedBox(
                                            width:
                                                24,
                                            height:
                                                24,
                                            child: CircularProgressIndicator(
                                              color:
                                                  Colors.white,
                                              strokeWidth:
                                                  2,
                                            ),
                                          )
                                          : Text(
                                            'Create Account',
                                            style: TextStyle(
                                              fontSize:
                                                  isTablet
                                                      ? 18
                                                      : 16,
                                              fontWeight:
                                                  FontWeight.w600,
                                            ),
                                          ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        height:
                            24,
                      ),

                      // Sign In Link
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Colors.white.withOpacity(
                                0.7,
                              ),
                              fontSize:
                                  isTablet
                                      ? 16
                                      : 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to sign in page
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: const Color(
                                  0xFF6C5CE7,
                                ),
                                fontSize:
                                    isTablet
                                        ? 16
                                        : 14,
                                fontWeight:
                                    FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height:
                            40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    String? Function(
      String?,
    )?
    validator,
    TextInputType? keyboardType,
    List<
      TextInputFormatter
    >?
    inputFormatters,
    bool isPassword =
        false,
  }) {
    final screenWidth =
        MediaQuery.of(
          context,
        ).size.width;
    final isTablet =
        screenWidth >
        600;

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(
              0.9,
            ),
            fontSize:
                isTablet
                    ? 16
                    : 14,
            fontWeight:
                FontWeight.w500,
          ),
        ),
        const SizedBox(
          height:
              8,
        ),
        TextFormField(
          controller:
              controller,
          validator:
              validator,
          keyboardType:
              keyboardType,
          inputFormatters:
              inputFormatters,
          obscureText:
              isPassword &&
              !_isPasswordVisible,
          style: TextStyle(
            color:
                Colors.white,
            fontSize:
                isTablet
                    ? 16
                    : 14,
          ),
          decoration: InputDecoration(
            hintText:
                hint,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(
                0.5,
              ),
              fontSize:
                  isTablet
                      ? 16
                      : 14,
            ),
            prefixIcon: Icon(
              icon,
              color: const Color(
                0xFF6C5CE7,
              ),
              size:
                  isTablet
                      ? 24
                      : 20,
            ),
            suffixIcon:
                isPassword
                    ? IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white.withOpacity(
                          0.7,
                        ),
                        size:
                            isTablet
                                ? 24
                                : 20,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _isPasswordVisible =
                                !_isPasswordVisible;
                          },
                        );
                      },
                    )
                    : null,
            filled:
                true,
            fillColor: Colors.white.withOpacity(
              0.08,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
              borderSide:
                  BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(
                  0.1,
                ),
                width:
                    1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
              borderSide: const BorderSide(
                color: Color(
                  0xFF6C5CE7,
                ),
                width:
                    2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
              borderSide: const BorderSide(
                color:
                    Colors.redAccent,
                width:
                    1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
              borderSide: const BorderSide(
                color:
                    Colors.redAccent,
                width:
                    2,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal:
                  16,
              vertical:
                  isTablet
                      ? 20
                      : 16,
            ),
          ),
        ),
      ],
    );
  }

  void _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      setState(
        () {
          _isLoading =
              true;
        },
      );

      // Simulate API call
      await Future.delayed(
        const Duration(
          seconds:
              2,
        ),
      );

      setState(
        () {
          _isLoading =
              false;
        },
      );

      // Handle successful registration
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        SnackBar(
          content: const Text(
            'Account created successfully!',
          ),
          backgroundColor: const Color(
            0xFF6C5CE7,
          ),
          behavior:
              SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
      );
    }
  }
}
