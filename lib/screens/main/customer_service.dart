import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerService extends StatefulWidget {
  CustomerService(this.submitFn);

  final void Function(String note) submitFn;

  @override
  _CustomerServiceState createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  final _formKey = GlobalKey<FormState>();

  String _note = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_note);
      //Used to send auth request
    }
  }

  //////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "إدارة العملاء",
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
      ///////
      body: Container(
        margin: EdgeInsets.only(top: 40 , right: 5 , left:5),
        child: Column(
          children: <Widget>[
            IconTheme(
              data: IconThemeData(color: Colors.white),
              child: Icon(
                Icons.supervised_user_circle,
                size: 70,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(top: 20 , right: 5 , left:5 , bottom: 10 ),
                child: Text(
                  "المشكلة؟",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25 ,
                      color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            //////
            Container(
              margin: EdgeInsets.only(right: 5 , left:5 , bottom: 30),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  key: ValueKey('note'),
                  validator: (value) {
                    if (value.isEmpty || value.length < 8) {
                      return ('أدخل ملاحظات صحيحة');
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _note = value;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "ملاحظات",
                      prefixIcon: Padding(
                        child: IconTheme(
                          data: IconThemeData(
                              color: Theme.of(context).primaryColor),
                          child: Icon(Icons.note_add),
                        ),
                        padding: EdgeInsets.all(5),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 180,
              child: RaisedButton(
                child: Text(
                  'إرسال',
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                onPressed: _trySubmit,
              ),
            )
          ],
        ),
      ),
    );
  }
}
