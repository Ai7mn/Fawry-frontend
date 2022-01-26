import 'file:///D:/Flutter%20projects/fawry/lib/screens/main/services_screen.dart';
import 'package:fawry/screens/main/customer_service.dart';
import 'package:fawry/screens/main/my_balance.dart';
import 'package:fawry/screens/main/notification_Screen.dart';
import 'package:fawry/screens/main/reports.dart';
import 'package:fawry/screens/main/settings_screen.dart';
import 'package:fawry/screens/main/transaction.dart';
import 'package:fawry/screens/main/wholesale.dart';
import 'package:fawry/screens/services_screens/fast_topup.dart';
import 'package:fawry/widgets/main/Option.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor ,
        leading: InkWell(
          child: Container(
            padding: EdgeInsets.only( left: 7 , top: 3),
            child: Image.asset("Images/logo.png"),
          ),
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsScreen()));},
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationScreen()));}),
        ],
      ),
      body:
      Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  child: IconTheme(
                    data: IconThemeData(
                        color:Colors.white),
                    child: Icon(Icons.account_circle , size: 100,),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Text("ايمن احمد احمد" , style: TextStyle(color: Colors.white ,fontSize: 20 , fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 20,
                ),
                Text("رقم الحساب : 1789 " , style: TextStyle(color: Colors.white ,fontSize: 15),),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),

             Container(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   InkWell(
                     child: Padding(
                       padding: const EdgeInsets.all(3),
                       child: Option(Icons.apps , "الخدمات"),
                     ),
                     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> ServicesScreen()));},
                   ),
                   InkWell(
                     child: Padding(
                       padding: const EdgeInsets.all(3),
                       child: Option(Icons.account_balance_wallet , "رصيدي"),
                     ),
                     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> MyBalance()));},
                   ),
                   InkWell(
                     child: Padding(
                       padding: const EdgeInsets.all(3),
                       child: Option(Icons.receipt , "التقارير"),
                     ),
                     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Report()));},
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
                       child: Option(FontAwesomeIcons.moneyBillWave , "الحوالات المالية"),
                     ),
                     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> MainTransactionScreen()));},
                   ),
                   InkWell(
                     child: Padding(
                       padding: const EdgeInsets.all(3),
                       child: Option(Icons.monetization_on , "شحن الجملة"),
                     ),
                     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> WholeSale(null)));},
                   ),
                   InkWell(
                     child: Padding(
                       padding: const EdgeInsets.all(3),
                       child: Option(Icons.phone_iphone , "الشحن السريع"),
                     ),
                     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> FastTopUP(null)));},
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
                       child: Option(Icons.add_shopping_cart , "متجر فوري"),
                     ),
                   ),
                   InkWell(
                     child: Padding(
                       padding: const EdgeInsets.all(3),
                       child: Option(Icons.supervised_user_circle , "إدارة العملاء"),
                     ),
                     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomerService(null)));},
                   ), InkWell(
                     child: Padding(
                       padding: const EdgeInsets.all(3),
                       child: Option(Icons.exit_to_app , "خروج"),
                     ),
                   ),
                 ],
               ),
             ),

        ],
      ),
    );
  }
}
