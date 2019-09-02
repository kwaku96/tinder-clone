import 'package:flutter/material.dart';
import 'package:fluttery/layout.dart';

import 'ProfileCard.dart';

//entry point into the whole dragging magic

class DraggableCard extends StatefulWidget {
  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> {

  Offset cardOffset = const Offset(0.0,0.0);
  Offset dragStart;
  Offset dragPosition;

  @override
  Widget build(BuildContext context) {
    return AnchoredOverlay(
      showOverlay: true,
      child: Center(),
      overlayBuilder: (BuildContext context,Rect anchorBounds,Offset anchor){
        return CenterAbout(
          position: anchor,
          child: Transform(
            transform: Matrix4.translationValues(
              cardOffset.dx, cardOffset.dy, 0.0
            ),
            child: Container(
              width: anchorBounds.width,
              height: anchorBounds.height,
              padding: EdgeInsets.all(16.0),
              child: GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
                onPanEnd: _onPanEnd,
                child: ProfileCard()
              ),
            ),
          ),
        );
      },
    );
  }

  void _onPanStart(DragStartDetails details) {
    print('drag start');
    dragStart = details.globalPosition;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    print('drag update');
    setState(() {
      dragPosition = details.globalPosition;
      cardOffset = dragPosition - dragStart;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    print('drag end');
    setState(() {
      dragStart = null;
      dragPosition = null;
      cardOffset = const Offset(0.0,0.0);
    });
  }
}
