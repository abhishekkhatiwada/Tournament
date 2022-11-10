


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';



final  loginProvider = StateNotifierProvider<LoginProvider, bool>((ref) => LoginProvider(true));


class LoginProvider extends StateNotifier<bool>{
  LoginProvider(super.state);


  void toggle(){
    state = !state;
  }

}



final loadingProvider = StateNotifierProvider.autoDispose<LoadingProvider, bool>((ref) => LoadingProvider(false));

class LoadingProvider extends StateNotifier<bool>{
  LoadingProvider(super.state);

  void toggle(){
    state = !state;
  }

}

final  imageProvider = StateNotifierProvider<ImageProvider, XFile?>((ref) => ImageProvider(null));


class ImageProvider extends StateNotifier<XFile?>{
  ImageProvider(super.state);


  void imageSelect() async{
    final ImagePicker _picker = ImagePicker();
    state = await _picker.pickImage(source: ImageSource.gallery);
  }

}