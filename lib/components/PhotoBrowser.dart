import 'package:flutter/material.dart';
import 'package:tinder_clone/components/SelectedPhotoIndicator.dart';

class PhotoBrowser extends StatefulWidget {

  final List<String> photoAssetsPaths;
  final int visiblePhotoIndex;

  PhotoBrowser({
    this.photoAssetsPaths,
    this.visiblePhotoIndex
  });

  @override
  _PhotoBrowserState createState() => _PhotoBrowserState();
}

class _PhotoBrowserState extends State<PhotoBrowser> {
  int visiblePhotoIndex;
  List<String> photoAssetsPaths;

  @override
  void initState() {
    super.initState();
    visiblePhotoIndex = widget.visiblePhotoIndex;
    photoAssetsPaths = widget.photoAssetsPaths;
  }

  @override
  void didUpdateWidget(PhotoBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.visiblePhotoIndex != oldWidget.visiblePhotoIndex){
      setState(() {
        visiblePhotoIndex = widget.visiblePhotoIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        //photo
        Image.asset(
          photoAssetsPaths[visiblePhotoIndex],
          fit: BoxFit.cover,
        ),
        //photo indicator
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: SelectedPhotoIndicator(
            photoCount: photoAssetsPaths.length,
            visiblePhotoIndicator: visiblePhotoIndex,
          ),
        ),
        //photo Controls
        _buildPhotoControl()
      ],
    );
  }

  _prevImage(){
    setState(() {
      visiblePhotoIndex = visiblePhotoIndex > 0?visiblePhotoIndex-1:0;
    });
  }

  _nextImage(){
    setState(() {
      visiblePhotoIndex = photoAssetsPaths.length-1 > visiblePhotoIndex?
          visiblePhotoIndex+1 : visiblePhotoIndex ;
    });
  }

  Widget _buildPhotoControl(){
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        GestureDetector(
          onTap: _prevImage,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topLeft,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        GestureDetector(
          onTap: _nextImage,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        )
      ],
    );
  }
}
