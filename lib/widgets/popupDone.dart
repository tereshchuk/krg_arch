import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share/share.dart';

class PopUpDoneWidget extends StatelessWidget {
/*
 showDialog(
        context: context,
        builder: (context) {
          return PopUpDoneWidget();
        }
*/
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.close,
                size: 20,
                color: Colors.grey[500],
              ))),
      children: <Widget>[
        Center(
            child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(right: 10),
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 16,
                )),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text('Your text and more.',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                    fontSize: 15,
                  )),
            ),
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 52,
                  width: 89,
                  margin: EdgeInsets.only(top: 16),
                  padding:
                      EdgeInsets.only(left: 32, top: 17, right: 32, bottom: 17),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(171, 129, 255, 1),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Center(
                      child: Text('Ok!',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15,
                          ))),
                ))
          ],
        ))
      ],
    );
  }
}
