import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 70,
              width: 280,
              child: RaisedButton(
                child: Text(
                  'تأكيد الحساب',
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                onPressed: (){},
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              height: 70,
              width: 280,
              child: RaisedButton(
                child: Text(
                  'تغيير كلمة المرور',
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                onPressed: (){},
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              height: 70,
              width: 280,
              child: RaisedButton(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'إعدادت الأمان',
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20 ),
                  ),
                ),
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
