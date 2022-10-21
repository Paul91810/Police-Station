import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/fine_controller.dart';

class OffenseModel{
  String vehicleNumber,name,mobileNumber,amount,address,modeOfPayment,rcId,stationId;
  List<FineIndex> selectedOffense;
  OffenseModel({
    required this.address,
    required this.amount,
    required this.name,
    required this.mobileNumber,
    required this.modeOfPayment,
    required this.selectedOffense,
    required this.vehicleNumber,
    required this.rcId,
    required this.stationId
});
  
  Map<String,String> toJson(){
   List <int> offenseId=[]; 
    for (var i in selectedOffense){
      offenseId.add(i.index);
    }
    return {
        "offense_id":"1,2,3",
        "rc_id":rcId.toString(),
        "name":name.toString(),
        "phone_number":mobileNumber.toString(),
        "mode":modeOfPayment.toString(),
        "station_id":stationId.toString(),
        "amount":amount.toString(),
        "address":address.toString()
  
  
      // "vehicle_number":vehicleNumber.toString(),
      // "name":name,
      // "mobile_number":mobileNumber.toString(),
      // "offense":selectedOffense.toString(),
      // "amount":amount,
      // "address":address,
      // "mode_of_payment":modeOfPayment
    };

  }
  
}