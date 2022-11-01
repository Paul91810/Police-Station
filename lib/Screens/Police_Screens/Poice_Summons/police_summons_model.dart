class StationSummonsModel {
  List<Data>? data;
  int? statusCode;
  StationSummonsModel({this.data});
  StationSummonsModel.statusCode(status) {
    statusCode = status;
  }

  StationSummonsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? summonsId;
  String? offenseId;
  int? rcId;
  String? name;
  String? phoneNumber;
  String? address;
  String? date;
  String? attachment;
  int? stationId;
  String? createdAt;
  String? updatedAt;
  String? engineno;
  String? registernumber;
  String? rcStatus;
  String? pollutionvalidupto;
  String? insurancevalidupto;
  String? registrationdate;
  String? taxvalidupto;
  String? phonenumber;

  Data(
      {this.summonsId,
      this.offenseId,
      this.rcId,
      this.name,
      this.phoneNumber,
      this.address,
      this.date,
      this.attachment,
      this.stationId,
      this.createdAt,
      this.updatedAt,
      this.engineno,
      this.registernumber,
      this.rcStatus,
      this.pollutionvalidupto,
      this.insurancevalidupto,
      this.registrationdate,
      this.taxvalidupto,
      this.phonenumber});

  Data.fromJson(Map<String, dynamic> json) {
    summonsId = json['summons_id'];
    offenseId = json['offense_id'];
    rcId = json['rc_id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    date = json['date'];
    attachment = json['attachment'];
    stationId = json['station_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    engineno = json['engineno'];
    registernumber = json['registernumber'];
    rcStatus = json['rc_status'];
    pollutionvalidupto = json['pollutionvalidupto'];
    insurancevalidupto = json['insurancevalidupto'];
    registrationdate = json['registrationdate'];
    taxvalidupto = json['taxvalidupto'];
    phonenumber = json['phonenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['summons_id'] = summonsId;
    data['offense_id'] = offenseId;
    data['rc_id'] = rcId;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['address'] = address;
    data['date'] = date;
    data['attachment'] = attachment;
    data['station_id'] = stationId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['engineno'] = engineno;
    data['registernumber'] = registernumber;
    data['rc_status'] = rcStatus;
    data['pollutionvalidupto'] = pollutionvalidupto;
    data['insurancevalidupto'] = insurancevalidupto;
    data['registrationdate'] = registrationdate;
    data['taxvalidupto'] = taxvalidupto;
    data['phonenumber'] = phonenumber;
    return data;
  }
}
