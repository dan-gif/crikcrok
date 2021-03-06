import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ActivityFormImagePicker extends StatefulWidget {
  final Function updateUrl;

  ActivityFormImagePicker({this.updateUrl});

  @override
  _ActivityFormImagePickerState createState() =>
      _ActivityFormImagePickerState();
}

class _ActivityFormImagePickerState extends State<ActivityFormImagePicker> {
  File _deviceImage;

  Future<void> _pickImage(ImageSource source) async {
    try {
      _deviceImage = await ImagePicker.pickImage(source: source);
      if (_deviceImage != null) {
        setState(() {});
      } else {}
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.photo,color: Colors.black),
              label: Text('Galerie',style: TextStyle(color:Colors.black,fontSize: 20),),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
            FlatButton.icon(
              icon: Icon(Icons.photo_camera,color: Colors.black),
              label: Text('camera',style: TextStyle(color:Colors.black,fontSize: 20),),
              onPressed: () => _pickImage(ImageSource.camera,),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          child: _deviceImage != null
              ? Image.file(
            _deviceImage,
            fit: BoxFit.cover,
          )
              : Text('Aucune image',style: TextStyle(color:Colors.black,fontSize: 20),),
        )
      ],
    );
  }
}