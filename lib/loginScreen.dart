import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/Vector 55.png',
                fit: BoxFit.cover,
                scale: 0.8,
                color: Colors.lightBlue,
              ),
              Container(
                color: Colors.white, // Replace with your desired color
                child: Column(
                  children: [
                    const Text(
                      'Login to your account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    buildTextHead(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildTextFormfield(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildPasswordHead(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildPasswordField(),
                    const SizedBox(
                      height: 10,
                    ),
                    sendOtpButton(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildSocialApp(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildGoodleCircle(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextHead() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text('Enter your phone number'),
        )
      ],
    );
  }

  Widget buildPasswordHead() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text('Enter your Password '),
        )
      ],
    );
  }

  Widget buildTextFormfield() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          //FilteringTextInputFormatter.allow(RegExp(r'^[0-9]{0,10}$')),
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
        //maxLength: 10,
        validator: (value) {
          if (value!.isEmpty || value == "") {
            return "This field is required";
          } else if (value.length != 10) {
            return "Enter valid 10 digit mobile number";
          } else {
            return null;
          }
        },
        onChanged: (value) {
          _formKey.currentState!.validate();
        },
        // controller: userController,
        decoration: InputDecoration(
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.lightBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.lightBlue),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            Icons.phone,
            color: Colors.blue,
          ),
          hintText: '+91 9847362713',
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a password';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          // You can add additional validation logic here if needed
          return null;
        },
        onChanged: (value) {
          _formKey.currentState!.validate();
        },
        // controller: passwordController,
        decoration: InputDecoration(
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.lightBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.lightBlue),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          hintText: 'Enter your password',
        ),
      ),
    );
  }

  Widget sendOtpButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pop(context);
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Colors.blue), // Replace with your desired background color
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  10), // Replace with your desired border radius
            ),
          ),
        ),
        child: Text(
          "Send OTP",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontStyle: FontStyle.normal,
              ),
        ),
      ),
    );
  }

  Widget buildSocialApp() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            '-You Can Use Social Apps-',
            style: TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }

  Widget buildGoodleCircle() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 23,
          // foregroundImage:
          //     Journey.photoList != null ? MemoryImage(Journey.photoList!) : null,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        CircleAvatar(
          radius: 23,
          // foregroundImage:
          //     Journey.photoList != null ? MemoryImage(Journey.photoList!) : null,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.face,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
