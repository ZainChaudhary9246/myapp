import 'package:flutter/cupertino.dart';
import 'package:myapp/Models/InitDeviceModels/InitDeviceResponseModel.dart';

class InitDeviceProvider extends ChangeNotifier {
  InitResponseModel _initResponse;

  InitResponseModel get initResponse => _initResponse;

  setInitResponseModel(InitResponseModel responseModel) {
    _initResponse = responseModel;
    notifyListeners();
  }
}
