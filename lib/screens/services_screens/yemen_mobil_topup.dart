import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YemenMobileTopUp extends StatefulWidget {
  YemenMobileTopUp(this.submitFn);

  final void Function(
      String number,
      double amount,
      ) submitFn;

  @override
  _YemenMobileTopUpState createState() => _YemenMobileTopUpState();
}

class _YemenMobileTopUpState extends State<YemenMobileTopUp> {
  final _formKey = GlobalKey<FormState>();

  String _userNumber = '';
  double _amount = 0;

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userNumber.trim(), _amount);
      //Used to send auth request
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "الشحن السريع",
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
            onPressed: () {Navigator.pop(context);}),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // First Field
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    key: ValueKey('number'),
                    validator: (value) {
                      if (value.isEmpty || value.length != 9) {
                        return ('أدخل رقم هاتف صحيح');
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userNumber = value;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "أدخل رقم الهاتف",
                        prefixIcon: Padding(
                          child: IconTheme(
                            data: IconThemeData(
                                color: Theme.of(context).primaryColor),
                            child: Icon(Icons.contact_phone),
                          ),
                          padding: EdgeInsets.all(5),
                        )),
                  ),
                ),
              ),
              // second Field
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    key: ValueKey('amount'),
                    validator: (value) {
                      if (value.isEmpty || double.parse(value) < 100) {
                        return ('أدخل مبلغ صحيح');
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _amount = double.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "المبلغ",
                        prefixIcon: Padding(
                          child: IconTheme(
                            data: IconThemeData(
                                color: Theme.of(context).primaryColor),
                            child: Icon(Icons.attach_money),
                          ),
                          padding: EdgeInsets.all(5),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                    width: 150,
                    child: RaisedButton(
                      child: Text(
                        'شحن فوري',
                        style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                      onPressed: _trySubmit,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    height: 60,
                    width: 150,
                    child: RaisedButton(
                      child: Text(
                        'تسديد',
                        style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,),
                      ),
                      onPressed: _trySubmit,
                    ),
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
