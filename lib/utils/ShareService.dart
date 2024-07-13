
import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';



Future<void> onShare(String url) async {
  var status = await Permission.storage.status;
  if (status.isDenied) {
    await Permission.storage.request();
  }
  var imageId = await ImageDownloader.downloadImage(
      url);
  if (imageId == null) {
    return;
  }
  var path = await ImageDownloader.findPath(imageId);
  await Share.shareFiles(
    [path!],
    // text: '''Specie Name: ${fishSpecie.speciesName}\n'''
    //     '''Protein Content: ${fishSpecie.protein}\n''',
    // subject: fishSpecie.quote,
  );
}