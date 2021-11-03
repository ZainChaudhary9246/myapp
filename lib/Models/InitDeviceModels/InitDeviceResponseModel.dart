class InitResponseModel {
  String accessToken;
  String expiresAt;
  int deviceId;
  bool accountConnected;
  bool profileConnected;
  String timeZone;
  String deviceMode;

  InitResponseModel(
      {this.accessToken,
      this.expiresAt,
      this.deviceId,
      this.accountConnected,
      this.profileConnected,
      this.timeZone,
      this.deviceMode});

  InitResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiresAt = json['expiresAt'];
    deviceId = json['deviceId'];
    accountConnected = json['accountConnected'];
    profileConnected = json['profileConnected'];
    timeZone = json['timeZone'];
    deviceMode = json['deviceMode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['expiresAt'] = this.expiresAt;
    data['deviceId'] = this.deviceId;
    data['accountConnected'] = this.accountConnected;
    data['profileConnected'] = this.profileConnected;
    data['timeZone'] = this.timeZone;
    data['deviceMode'] = this.deviceMode;
    return data;
  }
}
