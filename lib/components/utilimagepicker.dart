import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Widget bottomSheetForSelectionFile(
    BuildContext context, ValueChanged<File> onFileSelection) {
  final ImagePicker _picker = ImagePicker();

  return Container(
    padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
    // decoration: BoxDecoration(
    //     // color: ColorConstants.bottomSheetColor,
    //     borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    //     border: Border.all(color: Colors.black)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
            leading: Icon(
              Icons.camera,
              size: 30,
            ),
            title: Text("Take a Picture",
                style: TextStyle(
                  fontSize: 20,
                )),
            onTap: () async {
              Navigator.pop(context);

              // Capture a photo
              final XFile? _documentFile =
                  await _picker.pickImage(source: ImageSource.camera);
              print("file ${_documentFile}");
              /*File _documentFile = await ImagePicker.pickImage(
                  source: ImageSource.camera, imageQuality: 25);*/
              onFileSelection(File(_documentFile!.path));
              // We didn't ask for permission yet or the permission has been denied before but not permanently.

// You can can also directly ask the permission about its status.
            }),
        ListTile(
          leading: Icon(
            Icons.image,
            size: 30,
          ),
          title: Text("Select from File",
              style: TextStyle(
                fontSize: 20,
              )),
          onTap: () async {
            Navigator.pop(context);

            final XFile? _documentFile =
                await _picker.pickImage(source: ImageSource.gallery);
            print("file ${_documentFile}");
            //File _documentFile = await ImagePicker.pickImage(source: ImageSource.gallery,imageQuality: 30);

            onFileSelection(File(_documentFile!.path));

            // onFileSelection(result.);
          },
        ),
      ],
    ),
  );
}
