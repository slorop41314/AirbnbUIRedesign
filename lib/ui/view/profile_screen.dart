import 'package:NitipBeli/ui/metrics.dart';
import 'package:NitipBeli/ui/shared/button/secondary_button.dart';
import 'package:NitipBeli/ui/view/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          SizedBox(
            width: 40,
            child: InkWell(
              onTap: () {
                print("Ontap Settings");
              },
              child: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                padding: padding_container,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Albert Stanley",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text("082134156961"),
                    Text("albert.freelancer8@gmail.com"),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      title: Text(
                        "Reservation center",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onTap: () {},
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      title: Text(
                        "Payment",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onTap: () {},
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      title: Text(
                        "Notification",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onTap: () {},
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      title: Text(
                        "Help",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onTap: () {},
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ),
            ),
            SecondaryButton(
              buttonTitle: "Logout",
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.route_name);
              },
              buttonColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
