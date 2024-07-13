

import 'package:convenient_thought/Images.dart';
import 'package:convenient_thought/ui/FullScreenImageView.dart';
import 'package:convenient_thought/utils/ShareService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

gridViewImages(List<Images> imageList)=>GridView.builder(
gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
maxCrossAxisExtent: 300,
childAspectRatio: 2/ 3,
crossAxisSpacing:1,
mainAxisSpacing: 1),
itemCount:imageList.length,
itemBuilder: (BuildContext ctx, index) {
return   Stack(
children: [
GestureDetector(
  onTap: (){
    Get.to(()=>const FullScreenImageView(),arguments: {'index':index,'listImages':imageList});
  },
  child:   Container(
  decoration: BoxDecoration(
  image: DecorationImage(
  fit: BoxFit.fill,
  image:NetworkImage(imageList[index].images)),),
  child: Align(
  alignment: FractionalOffset.bottomRight,
  child: Container(

  padding: const EdgeInsets.only(

  left: 8.0,

  right: 8.0,

  ),

  alignment: Alignment.centerRight,
     
  height: 50.0,

  width: 270.0,

  decoration: BoxDecoration(

  // borderRadius: const BorderRadius.only(

  // bottomLeft: Radius.circular(20.0),

  // bottomRight: Radius.circular(20.0),

  // ),

  color: Colors.grey.withOpacity(0.5),

  ),

  child: Row(
    children: [

      Text(imageList[index].id.toString()),
      Text(imageList[index].groupNo.toString(),style:TextStyle(color:Colors.blue)),
      IconButton(

      icon:const Icon(Icons.share,color: Colors.white,size: 36,),

      onPressed: () async {

      await onShare(imageList[index].images);

      },

      ),
    ],
  ),

  ),

  ),

  ),
),

],
);
});