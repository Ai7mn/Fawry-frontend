import 'package:fawry/screens/main/another_transaction.dart';
import 'package:fawry/screens/main/fawry_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "الحوالات المالية",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),

      body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 70,
              width: 280,
              child: RaisedButton(
                  child: Text(
                    'حوالة إلى مستخدم فوي آخر',
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> FawryTransaction(null)));},
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
                    'حوالة نقدية',
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20 ),
                  ),
                ),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> AnotherTransaction()));},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
