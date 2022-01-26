import 'package:fawry/screens/services_screens/bein.dart';
import 'package:fawry/screens/services_screens/fast_topup.dart';
import 'package:fawry/screens/services_screens/netflix.dart';
import 'package:fawry/widgets/services.dart';
import 'package:flutter/material.dart';


class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Theme.of(context).backgroundColor ,
        title: Text("الخدمات" , style:TextStyle(fontWeight: FontWeight.bold , color: Theme.of(context).primaryColor) ,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Services("Images/yemenmobile.png", "باقات يمن موبايل"),
                    ),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> FastTopUP(null)));},
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Services("Images/yemenmobile.png", "تسديد يمن موبايل"),
                    ),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> FastTopUP(null)));},
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Services("Images/mtn.png", "تسديد إم تي إن"),
                    ),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> FastTopUP(null)));},
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Services("Images/sabaphone.png", "تسديد سبأفون"),
                    ),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> FastTopUP(null)));},
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Services("Images/y.png", "تسديد واي"),
                    ),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> FastTopUP(null)));},
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Services("Images/adsl.png", "تسديد إنترنت"),
                    ),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> FastTopUP(null)));},
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Services("Images/home.png", "تسديد هاتف ثابت"),
                    ),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> FastTopUP(null)));},
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Services("Images/netflix.png", "إشتراك نت فلكس"),
                    ),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Netflix(null)));},
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Services("Images/bein.png", "إشتراك بي إن"),
                    ),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> BeIn(null)));},
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Services("Images/card.png", "كروت آبل و جوجل بلاي"),
                    ),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> FastTopUP(null)));},
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Services("Images/cashu.png", "تحويل رصيد كاش يو"),
                    ),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> FastTopUP(null)));},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}


