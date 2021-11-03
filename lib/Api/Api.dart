import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:myapp/Api/ApiException/Api.dart';
import 'package:myapp/Models/InitDeviceModels/InitDeviceRequestModel.dart';
import 'package:myapp/Models/InitDeviceModels/InitDeviceResponseModel.dart';
import 'package:myapp/Provider/InitDeviceProvider.dart';
import 'package:myapp/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// class InitService{
//   Future<InitResponseModel> initDevice() async {
//     Map<String, dynamic> jsonString;
//
//     try {
//       var dioRequest = new Dio();
//       dioRequest.options.baseUrl = globals.APIURL;
//
//       dioRequest.options.headers = {
//         // "content-type": "application/json",
//         // 'Content-Type': ' multipart/form-data',
//         // 'Charset': 'utf-8',
//         // 'X-localization': 'en',
//         // 'X-Maak-Auth': 'MAAK',
//       };
//
//       // var formData =
//       // {
//       //   "apk":"1.8",
//       //   "serialNumber":"212121",
//       //   "uuid":"00:00:00:00:00:00",
//       //   "firmware":"1.8",
//       //   "type":"Mobile",
//       //   "model":"iphone7",
//       //   "manufacturer":"Apple"
//       // };
//
//       InitRequestModel _initDeviceRequestModel = InitRequestModel(
//           apk: "1.8",
//         firmware: "1.8",
//         manufacturer: "Google",
//         model: "Iphone",
//         serialNumber: "12121212121",
//         type: "Mobile",
//         uuid: "00:00:00:00:00:00"
//       );
//       var response = await dioRequest.post(
//         "client/init",
//         data: jsonEncode(_initDeviceRequestModel.toJson()),
//       );
//
//       if (response.statusCode == 200) {
//         print(response);
//         InitResponseModel _responseModel = InitResponseModel.fromJson(response.data);
//         return _responseModel;
//       } else {
//         throw Exception('Failed to EditPlayerWithImage.');
//       }
//     } catch (e) {
//       print("Err: " + e.toString());
//     }
//   }
// }

class InitService {
  Future<InitResponseModel> initDevice(BuildContext context) async {
    try {
      InitRequestModel _initDeviceRequestModel = InitRequestModel(
          apk: "1.8",
          firmware: "1.8",
          manufacturer: "Google",
          model: "Iphone",
          serialNumber: "12121212121",
          type: "Mobile",
          uuid: "00:00:00:00:00:00");
      var response = await Api.postRequestData(
          'client/init', _initDeviceRequestModel.toJson());
      print("responsedata${response}");
      //  if (response.statusCode == 200) {
      //    print('Response status: ${response.statusCode}');
      InitResponseModel _responseModel = InitResponseModel.fromJson(response);
      Provider.of<InitDeviceProvider>(context, listen: false)
          .setInitResponseModel(_responseModel);
      return _responseModel;
    } catch (e) {
      print("Err: " + e.toString());
    }
  }
}
