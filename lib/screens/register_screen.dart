import 'package:flutter/material.dart';
import 'package:sleektask/Translations/locale_keys.dart';
import 'package:sleektask/utils/presentations/helpers.dart';
import 'dart:io';

import 'package:sleektask/utils/presentations/routes.dart';
import 'package:sleektask/utils/presentations/sized_box.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = Routes.registerScreen;
  const RegisterScreen({
    super.key,
  });
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? _profileImage;

  void _selectProfileImage() {
    // Implement logic to select profile image
    // Your code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                color: Colors.white, // Replace with your desired color
                child: Column(
                  children: [
                    SuraSizedBoxes.height_33,
                    buildHeaderText(),
                    SuraSizedBoxes.height_33,
                    buildProfileText(),
                    SuraSizedBoxes.height_33,
                    buildFirstText(),
                    SuraSizedBoxes.height_33,
                    buildLastText(),
                    SuraSizedBoxes.height_33,
                    buildDateText(),
                    SuraSizedBoxes.height_33,
                    buildEmailText(),
                    SuraSizedBoxes.height_33,
                    buildPasswordText(),
                    SuraSizedBoxes.height_33,
                    buildRegisterText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeaderText() {
    return Column(
      children: [
        Text(LocaleKeys.register.translate()),
      ],
    );
  }

  Widget buildProfileText() {
    return Column(
      children: [
        GestureDetector(
          onTap: _selectProfileImage,
          child: CircleAvatar(
            radius: 60,
            // foregroundImage: Journey.photoList != null
            //     ? MemoryImage(Journey.photoList!)
            //     : null,
            // backgroundColor: TSTSColors.black,
            child: Icons.person != null
                ? const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.amber,
                  )
                : const Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.amber,
                  ),
          ),
        ),
      ],
    );
  }

  Widget buildFirstText() {
    return Column(
      children: [
        TextFormField(
          controller: _firstNameController,
          decoration: InputDecoration(
            labelText: 'First Name',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your first name';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget buildLastText() {
    return Column(
      children: [
        TextFormField(
          controller: _lastNameController,
          decoration: InputDecoration(
            labelText: 'Last Name',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your last name';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget buildDateText() {
    return Column(
      children: [
        TextFormField(
          controller: _dateOfBirthController,
          decoration: InputDecoration(
            labelText: 'Date of Birth',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your date of birth';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget buildEmailText() {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget buildPasswordText() {
    return Column(
      children: [
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Password',
          ),
          obscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget buildRegisterText() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Perform registration logic
              // Your code here
            }
          },
          child: Text('Register'),
        ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title:
  //     ),
  //     body: Padding(
  //       padding: EdgeInsets.all(16),
  //       child: Form(
  //         key: _formKey,
  //         child: ListView(
  //           children: [

  //             SizedBox(height: 16),

  //             SizedBox(height: 16),

  //             SizedBox(height: 16),

  //             SizedBox(height: 16),

  //             SizedBox(height: 16),

  //             SizedBox(height: 16),

  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
