import 'dart:convert';

import 'package:http/http.dart' as http;

class QrCodeService {
  Future<QrCodeModel> qrCodeScannerService({required String url}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return QrCodeModel.fromJson(json.decode(response.body));
    } else {
      return throw Exception(response.statusCode);
    }
  }
}

// To parse this JSON data, do
//
//     final qrCodeModel = qrCodeModelFromJson(jsonString);

class QrCodeModel {
  List<Data>? data;

  QrCodeModel({this.data});

  QrCodeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? rcId;
  String? engineno;
  String? registernumber;
  String? rcStatus;
  String? pollutionvalidupto;
  String? insurancevalidupto;
  String? registrationdate;
  String? taxvalidupto;
  String? createdAt;
  String? updatedAt;
  String? phonenumber;

  Data(
      {this.rcId,
      this.engineno,
      this.registernumber,
      this.rcStatus,
      this.pollutionvalidupto,
      this.insurancevalidupto,
      this.registrationdate,
      this.taxvalidupto,
      this.createdAt,
      this.updatedAt,
      this.phonenumber});

  Data.fromJson(Map<String, dynamic> json) {
    rcId = json['rc_id'];
    engineno = json['engineno'];
    registernumber = json['registernumber'];
    rcStatus = json['rc_status'];
    pollutionvalidupto = json['pollutionvalidupto'];
    insurancevalidupto = json['insurancevalidupto'];
    registrationdate = json['registrationdate'];
    taxvalidupto = json['taxvalidupto'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phonenumber = json['phonenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rc_id'] = this.rcId;
    data['engineno'] = this.engineno;
    data['registernumber'] = this.registernumber;
    data['rc_status'] = this.rcStatus;
    data['pollutionvalidupto'] = this.pollutionvalidupto;
    data['insurancevalidupto'] = this.insurancevalidupto;
    data['registrationdate'] = this.registrationdate;
    data['taxvalidupto'] = this.taxvalidupto;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['phonenumber'] = this.phonenumber;
    return data;
  }
}


