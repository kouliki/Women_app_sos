// import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:women_safety/Components/Primary_button.dart';
import 'package:women_safety/Components/SecondaryButton.dart';
import 'package:women_safety/Components/women_textfield.dart';
import 'package:women_safety/child/child_login_screen.dart';
import 'package:women_safety/utils/constants.dart';

import '../model/user_model.dart';

class RegisterChildScreen extends StatefulWidget {
  @override
  State<RegisterChildScreen> createState() => _RegisterChildScreenState();
}

class _RegisterChildScreenState extends State<RegisterChildScreen> {
  // const RegisterChildScreen({Key? key}) : super(key: key);
  bool isPasswordshown = true;
  bool isRetypePasswordShown = true;

  final _formKey = GlobalKey<FormState>();

  final _formData = Map<String, Object>();
  bool isLoading=false;

  String? _password; // Store main password temporarily
  String? _retypePassword; // Store retype password temporarily

  _onSubmit() async {
    // Validate the form
    if (_formKey.currentState!.validate()) {
      // Save the form data
      _formKey.currentState!.save();

      // Debug prints to check the stored passwords
      print("Password: ${_formData['password']}");
      print("Retype Password: ${_formData['rpassword']}");

      // Check if the passwords match
      if (_formData['password'] != _formData['rpassword']) {
        // Show alert if passwords do not match
        dialogueBox(context, 'Passwords do not match.');
      } else {
        // Proceed with registration since passwords match
        print("Registration successful!");
        print("Email: ${_formData['email']}");

        // Start the progress indicator
        progressIndicator(context);

        try {
          setState(() {
            isLoading = true; // Set loading state
            });
          //
          //   // Create user with email and password
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
              email: _formData['email'].toString(),
              password: _formData['password'].toString());
          //
          //   // Check if user is created
          if (userCredential.user != null) {
            final v = userCredential.user!.uid;
            DocumentReference<Map<String, dynamic>> db =
            FirebaseFirestore.instance.collection('users').doc(v);

            // Create a UserModel instance
            final user = UserModel(
              name: _formData['name'].toString(),
              phone: _formData['phone'].toString(),
              childEmail: _formData['email'].toString(),
              guardianEmail: _formData['gemail'].toString(),
              id: v,
              type: 'child',
            );
            //
            final jsonData = user.toJson();
            await db.set(jsonData).whenComplete(() {
              // Navigate to LoginScreen after registration
              goTo(context, LoginScreen());
              setState(() {
                        isLoading = false; // Reset loading state
              });
            });
          }
        } on FirebaseAuthException catch (e) {
          // Handle specific Firebase exceptions
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
            dialogueBox(context, 'The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
            dialogueBox(context, 'The account already exists for that email.');
          }
          setState(() {
            isLoading = false; // Reset loading state on error
          });
        } catch (e) {
          // Handle any other exceptions
          print(e);
          setState(() {
            isLoading = false; // Reset loading state on error
          });
          dialogueBox(context, e.toString());
        }
      }
      print(_formData['email']);
      print(_formData['password']);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: ListView(
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
                child: Stack(
                  children: [
                    isLoading
                        ? progressIndicator(context)
                        :
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'REGISTER AS CHILD',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                              color: Color(0xfffc3b77),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.asset(
                            'assets/logo.png',
                            height: 100,
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.75,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomField(
                        onsave: (name) {
                          _formData['name'] = name ?? ' ';
                        },
                        hintText: "Enter name",
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.name,
                        prefix: Icon(Icons.person),
                        validate: (email) {
                          if (email!.isEmpty || email.length < 3) {
                            return 'enter correct name';
                          }
                          return null;
                        },

                      ),
                      CustomField(
                        hintText: 'enter phone',
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.phone,
                        prefix: Icon(Icons.phone),
                        onsave: (phone) {
                          _formData['phone'] = phone ?? "";
                        },
                        validate: (email) {
                          if (email!.isEmpty || email.length < 10) {
                            return 'enter correct phone';
                          }
                          return null;
                        },
                      ),
                      CustomField(
                        onsave: (email) {
                          _formData['email'] = email ?? ' ';
                        },
                        hintText: "Enter email",
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.emailAddress,
                        prefix: Icon(Icons.person),
                        validate: (email) {
                          if (email!.isEmpty || email.length < 3 ||
                              !email.contains("@")) {
                            return "Enter a correct email";
                          }
                          return null;
                        },

                      ),
                      CustomField(
                        hintText: 'enter guardian email',
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.emailAddress,
                        prefix: Icon(Icons.person),
                        onsave: (gemail) {
                          _formData['gemail'] = gemail ?? "";
                        },
                        validate: (email) {
                          if (email!.isEmpty ||
                              email.length < 3 ||
                              !email.contains("@")) {
                            return 'enter correct email';
                          }
                        },
                      ),
                      CustomField(
                        hintText: "Enter password",
                        isPassword: isPasswordshown,
                        prefix: Icon(Icons.vpn_key_rounded),
                        onsave: (password) {
                          _formData['password'] = password ?? '';
                        },
                        validate: (password) {
                          if (password!.isEmpty ||
                              password.length < 7) {
                            return "Enter a correct password";
                          }
                          return null;
                        },
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordshown = !isPasswordshown;
                            });
                          },
                          icon: isPasswordshown ? Icon(
                              Icons.visibility_off) : Icon(
                              Icons.visibility),
                        ),
                      ),
                      CustomField(
                        hintText: "Retype password",
                        isPassword: isRetypePasswordShown,
                        prefix: Icon(Icons.vpn_key_rounded),
                        onsave: (password) {
                          _formData['rpassword'] = password ?? '';
                        },
                        validate: (password) {
                          if (password!.isEmpty ||
                              password.length < 7) {
                            return "Enter a correct password";
                          }
                          return null;
                        },
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isRetypePasswordShown =
                              !isRetypePasswordShown;
                            });
                          },
                          icon: isRetypePasswordShown ? Icon(
                              Icons.visibility_off) : Icon(
                              Icons.visibility),
                        ),
                      ),

                      PrimaryButton(
                        title: "REGISTER",
                        onPressed: _onSubmit,
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom section for additional options
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // SecondaryButton(
                  //   title: "Click here",
                  //   onPressed: () {},
                  // ),
                  SecondaryButton(
                    title: "Login with user account",
                    onPressed: () {
                      goTo(context, LoginScreen());
                      // this part is in constants.dart
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
