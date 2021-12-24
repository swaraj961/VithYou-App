import 'package:flutter/material.dart';
import 'package:quick_feedback/quick_feedback.dart';
import 'package:vithyou/auth/signin.dart';

class SideDrawer extends StatelessWidget {
  void showFeedback(context) {
    showDialog(
      context: context,
      builder: (context) {
        return QuickFeedback(
          title: 'Leave a feedback', // Title of dialog
          showTextBox: true, // default false
          textBoxHint:
              'Share your feedback', // Feedback text field hint text default: Tell us more
          submitText: 'SUBMIT', // submit button text default: SUBMIT
          onSubmitCallback: (feedback) {
            //Todo!: add rating to firebase 
            print('$feedback'); // map { rating: 2, feedback: 'some feedback' }
            Navigator.of(context).pop();
          },
          askLaterText: 'ASK LATER',
          onAskLaterCallback: () {
            print('Do something on ask later click');
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Welcome ${userName.substring(0, userName.indexOf(' '))}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help line number'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('User Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
              leading: Icon(Icons.stars),
              title: Text('Rate us'),
              onTap: () => {showFeedback(context)}),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              signOut(),
              Navigator.popAndPushNamed(context, '/'),
            },
          ),
        ],
      ),
    );
  }
}
