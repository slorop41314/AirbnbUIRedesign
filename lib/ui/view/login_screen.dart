import 'package:NitipBeli/core/service/localdata_service.dart';
import 'package:NitipBeli/ui/metrics.dart';
import 'package:NitipBeli/ui/shared/button/primary_button.dart';
import 'package:NitipBeli/ui/view/home_screen.dart';
import 'package:NitipBeli/utils/image_path.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const route_name = "LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneNumberController = TextEditingController();
  bool isButtonEnabled = false;
  void _onTapLogin() {
    // Login networking here

    // Saving data here
    LocalService.shared.changeUserLoginStatus(true);
    // Navigation
    Navigator.of(context).pushReplacementNamed(HomeScreen.route_name);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: padding_container,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  logo_image_path,
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: content_child_margin,
                ),
                Text(
                  "Join the Airbnb community",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: content_margin,
                ),
                Text(
                  "Phone number",
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  hint: Text(
                    "Choose country",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  items: <String>['A', 'B', 'C', 'D'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Text("+ 62"),
                      SizedBox(
                        height: 20,
                        child: VerticalDivider(),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (text) {
                            if (text.length > 8) {
                              setState(() {
                                isButtonEnabled = true;
                              });
                            }
                          },
                          keyboardType: TextInputType.phone,
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: "E.g 812 1314 1516",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PrimaryButton(
                  buttonTitle: "Sign up with phone number",
                  onTap: isButtonEnabled
                      ? () {
                          this._onTapLogin();
                        }
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
