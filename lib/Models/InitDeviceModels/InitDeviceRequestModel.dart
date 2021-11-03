class InitRequestModel {
  String apk;
  String serialNumber;
  String uuid;
  String firmware;
  String type;
  String model;
  String manufacturer;

  InitRequestModel(
      {this.apk,
      this.serialNumber,
      this.uuid,
      this.firmware,
      this.type,
      this.model,
      this.manufacturer});

  InitRequestModel.fromJson(Map<String, dynamic> json) {
    apk = json['apk'];
    serialNumber = json['serialNumber'];
    uuid = json['uuid'];
    firmware = json['firmware'];
    type = json['type'];
    model = json['model'];
    manufacturer = json['manufacturer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apk'] = this.apk;
    data['serialNumber'] = this.serialNumber;
    data['uuid'] = this.uuid;
    data['firmware'] = this.firmware;
    data['type'] = this.type;
    data['model'] = this.model;
    data['manufacturer'] = this.manufacturer;
    return data;
  }
}
