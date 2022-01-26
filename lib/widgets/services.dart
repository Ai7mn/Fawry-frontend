import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Services extends StatefulWidget {
  Services(this.image, this.text);

  final String image;
  final String text;

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Container(
        height: 151,
        width: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(widget.image),
            ),
            Text(
              widget.text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
