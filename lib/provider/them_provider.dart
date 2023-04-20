
import 'package:flutter/cupertino.dart';
import '../modals/them_modal.dart';

class  ThemProvider extends ChangeNotifier
{
  ThemModal  themData = ThemModal(isDark: true);

  void them(){
      themData.isDark = !themData.isDark;
      notifyListeners();
  }
}