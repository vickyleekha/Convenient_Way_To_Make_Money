
import 'package:flutter/material.dart';

class ContentOfTheDay extends StatefulWidget {
  const ContentOfTheDay({Key? key}) : super(key: key);

  @override
  State<ContentOfTheDay> createState() => _ContentOfTheDayState();
}

class _ContentOfTheDayState extends State<ContentOfTheDay> {



  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        fit: BoxFit.fill,
        image:NetworkImage("https://backendlessappcontent.com/DF5BEC9F-AD65-E57E-FF54-82E514071F00/8F60DB66-643C-4E11-9EF3-CFFBBE86800B/files/APP+Quotes/Pins/Pins/2a969dfc2b9140bc686498f603abe134.jpg")),),
    child: Align(
    alignment: FractionalOffset.bottomRight,
    child:Container(

      padding: const EdgeInsets.only(

        left: 8.0,

        right: 8.0,

      ),

      alignment: Alignment.centerRight,

      height: 50.0,
      decoration: BoxDecoration(

        // borderRadius: const BorderRadius.only(

        // bottomLeft: Radius.circular(20.0),

        // bottomRight: Radius.circular(20.0),

        // ),

        color: Colors.grey.withOpacity(0.5),

      ),

      child: IconButton(

        icon:const Icon(Icons.share,color: Colors.white,size: 36,),

        onPressed: () async {

          // await onShare(imageList[index].images);

        },

      ),



    )));
  }
}
