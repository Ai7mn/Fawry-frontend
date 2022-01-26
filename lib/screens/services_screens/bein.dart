import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BeIn extends StatefulWidget {
  BeIn(this.submitFn);

  final void Function(
    String number,
    String name,
    String cardNo,
  ) submitFn;

  @override
  _BeInState createState() => _BeInState();
}

class _BeInState extends State<BeIn> {
  final _formKey = GlobalKey<FormState>();

  String _userNumber = '';
  String _name = '';
  String _cardNo = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userNumber.trim(), _name, _cardNo);
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
          "BEIN",
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
                  height: 10,
                ),
                Text(
                  'تجديد الإشتراك',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                //First Field

                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      key: ValueKey('cardNo'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 6) {
                          return ('أدخل رقم كرت صحيح');
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _cardNo = value;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "رقم الكرت",
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
                //Second Field
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "اسم العميل",
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
                //Third Field
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                          labelText: "رقم الهاتف",
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
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "* تنويه ، إذا كان الإشتراك شهري وكان عليك أقساط لم تسدد فسوف يتم خصمها عليك من قبل شركة bein",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 15),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: DropdownButton(
                        icon: Row(
                          children: <Widget>[
                            Icon(
                              Icons.arrow_drop_down,
                              color: Theme.of(context).backgroundColor,
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Text(
                              'باقات الإشتراك',
                              style: TextStyle(
                                  color: Theme.of(context).backgroundColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Container(
                              child: Text('إشتراك نوع 1'),
                            ),
                            value: 'item1',
                          ),
                          DropdownMenuItem(
                            child: Container(
                              child: Text('إشتراك نوع 2'),
                            ),
                            value: 'item2',
                          ),
                        ],
                        onChanged: (itemIdentifier) {
                          if (itemIdentifier == 'item1') {}
                        },
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 200,
                      child: RaisedButton(
                        child: Text(
                          'إتمام عملية التجديد',
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
