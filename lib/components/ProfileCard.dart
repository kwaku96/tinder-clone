import 'package:flutter/material.dart';
import 'package:tinder_clone/components/PhotoBrowser.dart';

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 5.0,
            spreadRadius: 2.0
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Material(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildBackground(),
              _buildProfileSynopsis()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackground(){
    //return Image.asset('assets/photo_1.jpg',fit: BoxFit.cover);
    return PhotoBrowser(
      photoAssetsPaths: [
        'assets/photo_1.jpg',
        'assets/photo_2.jpg',
        'assets/photo_3.jpg',
        'assets/photo_4.jpg'
      ],
      visiblePhotoIndex: 0,
    );
  }

  Widget _buildProfileSynopsis(){
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.8)
            ]
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'First Last',
                      style: TextStyle(fontSize: 24.0,color: Colors.white),
                    ),
                    Text(
                      'Some description',
                      style: TextStyle(fontSize: 18.0,color: Colors.white),
                    ),
                  ],
                ),
              ),
              Icon(Icons.info,color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
