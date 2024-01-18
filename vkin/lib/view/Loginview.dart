import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vkin/Controller/login_controller.dart';

import 'package:vkin/Font1.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernamecontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  final LoginController _loginController = Get.put(LoginController());

  String? username, password;

  final _formKey = GlobalKey<FormState>();

  bool isHiddenPassword = true;

  void _togglepasswordview() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 252, 255, 98),
                      Color.fromARGB(255, 255, 255, 252).withOpacity(0.4),
                      Color.fromARGB(250, 35, 177, 243).withOpacity(0.4),
                      Color.fromARGB(255, 255, 81, 200).withOpacity(0.1),
                    ],
                    stops: const [0.0, 0.0, 1.0, 1.0],
                  ),
                  backgroundBlendMode: BlendMode.colorBurn,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(51, 7, 7, 7),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 85,
                        left: 250,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/language.png",
                            height: 16,
                            width: 16,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          const Text(
                            "English",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Text(
                              "Login",
                              style: costumstyle(
                                  21, const Color(0xFF000000), FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Login to your vikn account",
                              style: costumstyle(
                                  15,
                                  Color.fromARGB(255, 196, 194, 194),
                                  FontWeight.w400),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 36, top: 50, right: 36),
                              child: Container(
                                width: 358,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        autofocus: false,
                                        onSaved: (value) => username = value,
                                        controller: usernamecontroller,
                                        validator: (value) => value!.isEmpty
                                            ? "Enter the user name"
                                            : null,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: Color(0xFF0A9EF3),
                                          ),
                                          hintText: "Username",
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        color:
                                            Color.fromARGB(255, 192, 190, 190),
                                      ),
                                      TextFormField(
                                        obscureText: isHiddenPassword,
                                        keyboardType: TextInputType.text,
                                        autofocus: false,
                                        onSaved: (value) => password = value,
                                        controller: passwordcontroller,
                                        validator: (value) => value!.isEmpty
                                            ? "Please enter password"
                                            : null,
                                        decoration: InputDecoration(
                                          hintText: "password",
                                          label: const Text("Password"),
                                          suffixIcon: InkWell(
                                            onTap: _togglepasswordview,
                                            child: const Icon(
                                              Icons.visibility,
                                              color: Color(0xFF0A9EF3),
                                            ),
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.key,
                                            color: Color(0xFF0A9EF3),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 10.0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgotten Password",
                                  style: costumstyle(16,
                                      const Color(0xFF0A9EF3), FontWeight.w400),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 48,
                              width: 125,
                              child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  color: const Color(0xFF0E75F4),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      _loginController.loginUser(
                                          username!, password!);
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sign in",
                                        style: costumstyle(
                                            15, Colors.white, FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.arrow_right_alt,
                                        color: Colors.white,
                                      ),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 200,
                            ),
                            Text(
                              "Don't have an Account?",
                              style: costumstyle(
                                  15, const Color(0xFF000000), FontWeight.w300),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Sign up now!",
                                  style: costumstyle(
                                      16,
                                      Color.fromARGB(255, 84, 190, 251),
                                      FontWeight.w500),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
