import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share/share.dart';

class PopUpOkWidget extends StatelessWidget {
  final keyPass;
  final scaffoldkeys;
/*
 showDialog(
        context: context,
        builder: (context) {
          return PopUpOkWidget();
        }
*/
  SnackBar snackbar = SnackBar(
      content: Text("✓  Id Copied"),
      duration: const Duration(milliseconds: 800));
  PopUpOkWidget({Key? key, required this.keyPass, required this.scaffoldkeys})
      : super(key: key);
  final Widget svg =
      SvgPicture.asset('images/share.svg', semanticsLabel: 'Share');

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          svg,
          Flexible(
              fit: FlexFit.loose,
              child: Container(
                  margin: EdgeInsets.only(left: 8),
                  constraints: BoxConstraints(
                    minWidth: 50,
                    maxWidth: 350,
                  ),
                  child: Text('Shared KRG ID to...',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.withOpacity(0.55),
                        fontSize: 15,
                      )))),
          Expanded(
              child: GestureDetector(
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
                      )))),
        ],
      ),
      children: <Widget>[
        Center(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(left: 35, right: 35, top: 20),
              constraints: BoxConstraints(
                minWidth: 50,
                maxWidth: double.infinity,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Color.fromRGBO(171, 129, 255, 1),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                  child: Text(keyPass.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color:
                            Color.fromRGBO(171, 129, 245, 1).withOpacity(0.35),
                        fontSize: 15,
                      ))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      await FlutterClipboard.copy(keyPass.toString());
                      scaffoldkeys.currentState.showSnackBar(snackbar);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 34),
                      padding: EdgeInsets.only(
                          left: 32, top: 17, right: 32, bottom: 17),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(171, 129, 255, 1),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Center(
                          child: Text('Copy ID',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 15,
                              ))),
                    )),
                SizedBox(width: 13),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      Share.share(keyPass.toString());
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 34),
                      padding: EdgeInsets.only(
                          left: 32, top: 17, right: 32, bottom: 17),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(196, 196, 196, 0.3),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Center(
                          child: Text('Share',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15,
                              ))),
                    ))
              ],
            )
          ],
        ))
      ],
    );
  }
}
