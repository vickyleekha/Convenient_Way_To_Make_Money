

import 'package:convenient_thought/Images.dart';
import 'package:convenient_thought/utils/ShareService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FullScreenImageView extends StatefulWidget {
  const FullScreenImageView({Key? key}) : super(key: key);
  @override
  State<FullScreenImageView> createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<FullScreenImageView> {
  dynamic argumentData = Get.arguments;
  List<Images> listImage=[];

  // String bannerReal="ca-app-pub-1673478345751921/2053995616";

  // String bannerTesting-='ca-app-pub-3940256099942544/6300978111';

  var position=0;
  PageController controller = PageController();
   BannerAd myBanner = BannerAd(
    adUnitId:"ca-app-pub-3940256099942544/6300978111" ,
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );


  @override
  void initState() {
    super.initState();
  listImage=argumentData['listImages'];
  position= argumentData['index'];

  }

   BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );

  @override
  Widget build(BuildContext context) {
    myBanner.load();
    AdWidget adWidget = AdWidget(ad: myBanner);

    // final AdSize adSize = AdSize(300, 50, width: null, height: null);
    final Container adContainer = Container(
      alignment: Alignment.center,
      width: myBanner.size.width.toDouble(),
      height: 70,
      child: adWidget,
    );
    return Scaffold(
      body: SafeArea(
        child:Stack(
          children: [
            PageView.builder(
              controller: controller,
              // pageSnapping: false,
              itemBuilder: (context, index) {
                if(position!=0){
                  _scrollToIndex(position);
                }

                position=0;

                return Container(

                  decoration: BoxDecoration(

                    image: DecorationImage(

                        fit: BoxFit.scaleDown,

                        image:NetworkImage(listImage[index].images)),),

                  child: Align(

                  alignment:

                  FractionalOffset.bottomRight,

                  child: Container(

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


                        await onShare(listImage[position].images);
                      },

                    ),

                  ),

                ),

                );

              },
              itemCount: listImage.length, // Can be null
            ),

            adContainer
          ],
        ),
      ),
    );
  }

  void _scrollToIndex(int index) {
    controller.animateToPage(index, duration: const Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
    // controller.jumpToPage(index);
  }
}


