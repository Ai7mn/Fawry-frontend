import 'package:fawry/widgets/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "التقارير",
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
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "من",
                      style: TextStyle(
                          fontSize: 17, color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Container(
                      width: 160,
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: DateField()),
                  Container(
                    child: Text(
                      "إلى",
                      style: TextStyle(
                          fontSize: 17, color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Container(
                      width: 160,
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: DateField()),
                ],
              ),
            ),
          ),
          ///////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 55,
                width: 110,
                child: RaisedButton(
                  child: Text(
                    'عرض',
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  onPressed: (){},
                ),
              ),
              Container(
                height: 65,
                width: 80,
                margin: EdgeInsets.only(right: 70 , left: 100 , top:5)  ,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Icon(Icons.print , size: 50, color: Theme.of(context).backgroundColor,),
              ),
            ],
          ),
          Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.only(right: 10 , left: 10 , top:5)  ,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ],
      ),
    );
  }
}
