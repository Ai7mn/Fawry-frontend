import 'package:flutter/material.dart';

class FawryTransaction extends StatefulWidget {

  FawryTransaction(this.submitFn);

  final void Function(
      String number,
      double amount,
      {String note}
      ) submitFn;

  @override
  _FawryTransactionState createState() => _FawryTransactionState();
}

class _FawryTransactionState extends State<FawryTransaction> {
  final _formKey = GlobalKey<FormState>();

  String _userNumber = '';
  double _amount = 0;
  String _note = '';
  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userNumber.trim(), _amount , note: _note);
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

      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // First Field
                SizedBox(
                  height: 50,
                ),
                Text(
                  'حوالة إلى مستخدم فوي آخر ',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
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
                          labelText: "أدخل رقم مستخدم فوري",
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
                //Empty field for name
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 10 , left: 10),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                //second Field
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
                //Third Field
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      onSaved: (value) {
                        _note = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "*أكتب ملاحظة",
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                      width: 200,
                      child: RaisedButton(
                        child: Text(
                          'تحويل',
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
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
      ),

    );
  }
}
