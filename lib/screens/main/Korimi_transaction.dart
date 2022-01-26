import 'package:flutter/material.dart';

class KorimiTransaction extends StatefulWidget {
  KorimiTransaction(this.submitFn);

  final void Function(
      String number,
      String name,
      double amount,
      {String note}
      ) submitFn;


  @override
  _KorimiTransactionState createState() => _KorimiTransactionState();
}

class _KorimiTransactionState extends State<KorimiTransaction> {

  final _formKey = GlobalKey<FormState>();

  String _receiverNumber = '';
  String _name = '';
  double _amount = 0;
  String _note = '';
  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_receiverNumber.trim(), _name , _amount , note: _note);
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
                  'كريمي',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,),
                ),
                //First Field
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      key: ValueKey('name'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 3) {
                          return ('أدخل اسم صحيح');
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "اسم المستلم",
                          prefixIcon: Padding(
                            child: IconTheme(
                              data: IconThemeData(
                                  color: Theme.of(context).primaryColor),
                              child: Icon(Icons.person),
                            ),
                            padding: EdgeInsets.all(5),
                          )),
                    ),
                  ),
                ),
                //Second Field

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
                        _receiverNumber = value;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "رقم المستلم",
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
                //Third Field
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
                //Forth Field
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "عمولة التحويل",
                          prefixIcon: Padding(
                            child: IconTheme(
                              data: IconThemeData(
                                  color: Theme.of(context).primaryColor),
                              child: Icon(Icons.money_off),
                            ),
                            padding: EdgeInsets.all(5),
                          )),
                    ),
                  ),
                ),
                //Fifth Field
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
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                      width: 140,
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
                    SizedBox(
                      height: 150,
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
